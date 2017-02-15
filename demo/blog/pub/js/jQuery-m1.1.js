(function(window,document){
	"use strict";
	var that;
	var Cache={
		length:0,
		isRefresh:false
	};
	var jQuery=window.jQuery=window.$=function(selector,context){
		return new jQuery.fn.init(selector,context);
	}

	jQuery.fn=jQuery.prototype={
		constructor:jQuery,
		init:function(selector,context){
			try{

				if(arguments==="undefined")return this;

				that=this;
				selector=selector||document;
				that.context=context=context||document;
				that.nodelist=[];

				if(typeof selector ==="string"){
					if(selector!==""){
						if(Cache[selector]&&!Cache.isRefresh){
							return Cache[selector];
						}
						Cache.isRefresh=false;
						//console.log("未使用缓存，正在储存数据"+selector+"到缓存");
						jQuery.Cache(selector,that);
						that.selector=selector;
						that.nodelist=jQuery.fn.find(selector,context);
					}
				}else if(selector instanceof Array){
					that.nodelist=selector;
					return that;
				}else if(typeof selector ==="object"){
					if(selector.nodeType){
						that.nodelist[0]=selector;
					}else if(selector instanceof jQuery){
						return selector;
					}

				}else if(typeof selector==="function"){
					jQuery.ready(selector);
				}

				that.length=that.nodelist.length;
				
			}catch(e){
				console.log(e);
			}
				return that;
		}
		
	};

	jQuery.extend=jQuery.fn.extend=function(source,target){

		target=target||this;
		for(var key in source){
			target[key]=source[key];
		}
		return target;
	}


	jQuery.extend({
		ready:function(fn){
			if (document.addEventListener){
				document.addEventListener( "DOMContentLoaded",fn, false ); 
			}else{
				setTimeout(fn,1);
			}
		},
		tpl:function(html,data){
			if(arguments.length>1){
				var res='';
				if(!(data instanceof Array)){
					data=[data];
				}
				jQuery.fn.each(function(k,i){
					res+=html.replace(/\{\*([a-zA-Z0-9][\s\S]*?)\}/g,function(s,m){
						return k[m]||'';
					});
				},data)
				return res;
			}
		},
		Cache:function(selector,value){
			if(arguments.length==0){
				return Cache;
			}else if(arguments.length==1&&typeof selector==="string"){
				return Cache[selector]
			}else{
				if(!Cache[selector]){
					Cache.length++;
				}
				Cache[selector]=selector;
				return Cache[selector]=value||undefined;
			}
		},
		refresh:function(selector,context){
			Cache.isRefresh=true;
			return jQuery(selector,context);

		},
		ajax:function (a){
			if(a.type&&a.url&&/jsonp/i.test(a.type)){
				var jsonp=document.createElement("script");
				jsonp.src=a.url;
				document.body.appendChild(jsonp);
				jsonp.parentElement.removeChild(jsonp);
				a.callback&&a.callback();
			}else{
				var x=window.XMLHttpRequest?new XMLHttpRequest():new ActiveXObject("Microsoft.XMLHTTP");
				x.open(a.type||"GET",a.url||"",a.async||false);
				if(/json/i.test(a.dataType)){
					x.overrideMimeType('text/json; charset=utf-8');
					x.setRequestHeader("X-Request","JSON");
					x.setRequestHeader("X-Requested-With","XMLHttpRequest");
				}
				/POST/i.test(a.type)&&x.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
				x.send(a.c||"");
				a.success&&a.success(x.responseText,x);
				return a.xhr?x:x.responseText;
			}
		}
	});

	//内部选择工具
	jQuery.extend({
		id:function(id,cxt){
			return [cxt.getElementById(id)];
		},
		tag:function(tag,cxt){
			return cxt.getElementsByTagName(tag);
		},
		cls:function(cls,cxt){
			//使用class建议设置cxt
			cxt=cxt||document;
			var ary=cxt.getElementsByTagName("*"),
				nodelist=[];

				// 这里使用$.each有个坑：ary会被作为对象遍历
				// 但是document对象除了标签之外还有其他的key
				// --- 该问题至少在选择video标签时会出现
			for(var i=0,len=ary.length;i<len;i++){
				if(jQuery.fn.hasClass(ary[i],cls)){
					nodelist.push(ary[i]);
				}
			}

			return nodelist;
		}
	});

	//工具
	jQuery.fn.extend({
		each:function(fn,data){
			if(!arguments.length)return this;

			var i=0,len;
			if(!data){
				data=[].slice.call(that.nodelist);
			}
			if(data instanceof Array){
				for(i=0,len=data.length;i<len;i++){
					if(fn.call(this,data[i],i)){
						return this;
					}
				}
			}else{
				for(var k in data){
					if(fn.call(this,data[k],i,k)){
						return this;
					}
					i++;
				}	
			}
			return this;
		}
	});

	//选择器
	jQuery.fn.extend({
		find:function(sel,cxt){

			if(cxt.length){
				var ele=[];
				var ary=[];
				var res;
				for(var i=0;i<cxt.length;i++){
					res=jQuery.fn.find(sel,cxt[i]);
					if(res.length){
						ele.push.apply(ele,res);
					}
				}
				return ele;
			}
			//传入字符串
			var a=sel.charAt(0),
				b=sel.substr(1),
				ary=sel.split(/,| /);
			//判断选择器是否为元字符
			if(ary.length==1||/\[|</.test(a)){

				if(a==="."){
					return jQuery.cls(b,cxt);
				}else if(a==="#"){
					return jQuery.id(b,cxt);
				}else if(a==="["){

				}else if(a==="<"){

				}else{
					//一个标签可能有多个class
					var clsAry=sel.split(".");

					//先选出第一个class的集合
					var res=jQuery.tag(clsAry[0],cxt);

					//如果是多个class
					if(clsAry.length>1){
						var nodes=[];
						var clss=sel.substr(sel.indexOf(".")+1);
						for(var i=0,len=res.length;i<len;i++){
							if(jQuery.fn.hasClass(res[i],clss)){
								nodes.push(res[i]);
							}
						};
						res=nodes;
					}
					return res;
				}


			//选择器字符集
			}else{
				for(var i=0,res;i<ary.length;i++){
					res=jQuery.fn.find(ary[i],cxt);
					cxt=res;
				}

				return res;
			}
			return this;
		}
	})

	//dom操作
	jQuery.fn.extend({
		append:function(tag){
			if(typeof tag==="string"){
				jQuery.fn.each(function(k,i){
					$(k).html(tag);
				})
			};
			return this;
		},
		siblings:function(sel){
			sel=sel||"";
			var target=this.nodelist[0];
			var doms=this.child(sel,this.nodelist[0].parentElement);
			var res=[];

			for(var i=0,k;i<doms.nodelist.length;i++){
				k=doms.nodelist[i];
				if(k!==target){
					res.push(k)
				}
			}
			this.siblings=$(res);
			return this.siblings;
		},
		parent:function(){
			var that=this;
			return that.$parent=$(that.nodelist[0].parentElement);
		},
		child:function(sel,cxt){
			if(arguments.length===0){
				sel="";
			}
			var ele=cxt||this.nodelist[0];
			var child=ele.children;
			var res=[];
			for(var i=0;i<child.length;i++){
				if(typeof sel!=="number"&&sel!==''&&!jQuery.fn.hasClass(sel,child[i])){
					continue;
				}
				child[i].nodeIndex=i;
				res.push(child[i]);
			}
			this.nodelist=res;
			if(this.selector){
				this.selector+=" :child("+sel+")";
			}
			return this;
		},
		eq:function(num){
			return $.Cache(this.selector+":eq("+num+")",$(this.nodelist[num]));
		},
		get:function(num){
			return this.nodelist[num];
		},
		index:function(){
			var that=this;
			var dom=that.nodelist[0];
			var ary=$(that).parent();
			var index=0;
			ary=ary.child();
			jQuery.fn.each(function(k,i){
				if(k===dom){
					index=i;
					return true;
				}
			},ary.nodelist);
			return index;
		}
	})


	//属性操作
	jQuery.fn.extend({
		hasClass:function(){
			var a=arguments;
			var ele,cls,clss,reg;

			if(a.length===0){
				return false;
			}else if(a.length===1){
				ele=this.nodelist[0];
				cls=arguments[0];
			}else{
				ele=a[0];
				cls=a[1];
			}
			cls=cls.replace(/\s{2,}/," ");
			clss=cls.split(".");

			if(clss.length==1){
				//cls在前中后位置 (^cls\s|\scls\s|\scls$)
				reg=new RegExp("(^"+cls+"\\s|\\s"+cls+"\\s|\\s"+cls+"$|^"+cls+"$)","g");
				return !!reg.test(ele.className);
			}else if(clss.length>1&&ele.className){
				reg=new RegExp("( "+clss.join(")( ")+")");
				return !!reg.test(" "+ele.className);
			}else{
				return false;
			}
			
		},
		addClass:function(cls){
			if(cls){
				for(var i=0,k;i<this.nodelist.length;i++){
					k=this.nodelist[i];
					if(!jQuery.fn.hasClass(k,cls)){
						k.className=(k.className||"")+" "+cls;
					}
				}
			}
			return this;
		},
		removeClass:function(cls){
			if(cls){
				cls=cls.split(" ");
				var reg=new RegExp("(\\s"+cls.join("||\\s")+")","g");
				jQuery.fn.each(function(k,i){
					k.className=(" "+k.className).replace(reg,function(m){
						return '';
					}).substring(1);
				});
			}
			return this;
		},
		attr:function(){
			var a=arguments;

			try{
				if(a.length===2){
					
					jQuery.fn.each(function(k,i){
						k.setAttribute(a[0],a[1]);
					},this.nodelist);

				}else if(a.length===1){
					return (this.nodelist.length?this.nodelist[0]:this.nodelist).getAttribute(a[0]);
				}
			}catch(e){

			}
			return this;
		},
		html:function(){
			var a=arguments;
			try{
				if(a.length===1){
					jQuery.fn.each(function(k,i){
						k.innerHTML=a[0];
					},this.nodelist);
				}else if(a.length===0){
					return (this.nodelist.length?this.nodelist[0]:this.nodelist).innerHTML;
				}
			}catch(e){

			}
			return this;
		},
		val:function(){
			var a=arguments;
			try{
				if(a.length===1){
					jQuery.fn.each(function(k,i){
						k.value=a[0];
					},this.nodelist);
				}else if(a.length===0){
					return (this.nodelist.length?this.nodelist[0]:this.nodelist).value;
				}
			}catch(e){

			}
			return this;
		},
		offset:function(){
			var ele=this.nodelist[0];
			return {
				top:ele.offsetTop,
				left:ele.offsetLeft,
				width:ele.offsetWidth,
				height:ele.offsetHeight
			}
		},
		width:function(){
			return parseInt(jQuery.fn.getStyle(this.nodelist[0],"width"));
		},
		height:function(){
			return parseInt(jQuery.fn.getStyle(this.nodelist[0],"height"));
		}
	})

	//css操作
	jQuery.fn.extend({
		css:function(key,val){

			if(key===undefined)return this;
			var sty="";
			var ary=[];

			//使用cssText前先拼接css样式
			if(arguments.length>1){
				sty=key+":"+val;
			}else if(typeof key ==="string"){
				if(/:/.test(key)){
					sty=key;
				}else {
					//参数只有一个，并且不包含:则获取其this.nodelist/this.nodelist[0]的key样式
					return jQuery.fn.getStyle(this.nodelist[0],key)
				}
			}else if(arguments.length==1){

				for(var i in key){
					i=i.replace(/[A-Z]/g,function(m){
						return "-"+m.toLowerCase();
					});
					ary.push(i+":"+key[i]);
				}
				sty=ary.join(";");
			}
			
			try{
				jQuery.fn.each(function(k,i){
					k.style.cssText+=sty;
				},this.nodelist)
			}catch(e){
				this.nodelist.style.cssText+=sty;
			}
		},
		getStyle:function (ele,val){
			ele=ele.length?ele[0]:ele;
			try{
				return window.getComputedStyle(ele)[val]
			}catch(e){
				return ele.currentStyle[val]
			}
		}
	})

	//事件处理
	jQuery.fn.extend({
		on:function(){
			var a=arguments;
			var type,fn,child;

			var that=this;
			if(a.length<2){
				return this
			}else{
				type=a[0].split(" ");
				if(a.length==2){
					fn=a[1];
				}else{
					child=a[1];
					fn=a[3];
				}
			}

			for(var n=0,len=type.length;n<len;n++){
				jQuery.fn.each(function(k,i){
					try{
						k.addEventListener(type[n],function(e){
							e=window.event;
							k.selector=that.selector;
							fn.call(k,e)
						});
					}catch(err){
						k.attachEvent("on"+type[n],function(e){
							e.target=e.srcElement;
							k.selector=that.selector;
							fn.call(k,e)
						});
					}
				},this.nodelist)
			}
		}
	})

	//杂项
	jQuery.fn.extend({
		isIE:function(){

		}
	})

	jQuery.fn.init.prototype=window.jQuery.prototype;

})(window,document);

