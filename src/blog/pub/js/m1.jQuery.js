(function(window,document){

		var that;
		var	cache={};
		var conf={
			index:0,
			isRefresh:false
		};
		var	jQuery = window.jQuery = window.$=function (selector,context){
				return new jQuery.fn.init(selector,context);
			};

		jQuery.fn=jQuery.prototype={

			constructor:jQuery,

			init:function(selector,context){

				that=this;
				that.selector=that.selector||"";
				that.context=context=context||document;
				//如果没有传递参数，则立即返回实例
				if(!selector){
					return that;
				}
				//如果不是强制刷新，且选择器结果已被缓存过，则返回缓存数据。
				//否则，重置强制刷新状态为否，并向下执行以获取选择结果
				if(!conf.isRefresh&&cache[selector]){
					//console.log("使用了【"+selector+"】的缓存数据");
					return cache[selector];
				}else{
					conf.isRefresh=false;
				}

				//处理选择器，并生成结果
				//select是封装的选择器核心，通过select得到结果并经过makeArray重构结果

				//以下可简写为
				//return jQuery.setCache(selector,jQuery.makeArray.call(that,jQuery.select.apply(that,arguments)))
				
				var res=jQuery.makeArray.call(that,jQuery.select.apply(that,arguments));

				//设置缓存
				jQuery.setCache(selector,res);
				res.$parent=context;
				return res;
			}
		};

		jQuery.extend=jQuery.fn.extend=function (source,target){
			if(!target){
				target=this;
			}
			for(var key in source){
				target[key]=source[key];
			}
			return target;
		};
		jQuery.extend({
			refresh:function(selector,context){
				//设置为可以刷新
				conf.isRefresh=true;
				//调用选择器刷新结果
				return jQuery.apply(this,arguments);
			},
			getCache:function(selector){
				if(selector&&typeof selector==="string"){
					return cache[selector];
				}else{
					return cache;
				}
			},
			setCache:function(selector,value){
				try{
					if(selector&&typeof selector==="string"){
						if(value){
							//value.selector=selector;
							value.$index=conf.index++;
							value.$timestamp=new Date().getTime();
						}
						return cache[selector]=value||undefined;
					}
				}catch(e){
					console.debug(e);
				}
				return this;
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
				
			}
		})
		jQuery.extend({
			id:function(id,cxt){
				return [cxt.getElementById(id)];
			},
			tag:function(tag,cxt){
				return cxt.getElementsByTagName(tag);
			},
			cls:function(cls,cxt){
				//使用class建议设置cxt
				
				var ary=cxt.getElementsByTagName("*"),
					nodelist=[];
				for(var i=0;i<ary.length;i++){
					if(jQuery.fn.hasClass(ary[i],cls)){
						nodelist.push(ary[i]);
					}
				};

				return nodelist;
			},
			select:function(sel,cxt){
				cxt=cxt||that.context||document;
				//传入字符串
				if(typeof sel ==="string"){
					this.selector=sel;
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
							var clsAry=sel.split(".");
							var res=jQuery.tag(clsAry[0],cxt);
							if(clsAry.length>1){
								var nodes=[];
								var clss=sel.substr(sel.indexOf(".")+1);
								jQuery.fn.each(function(k,i){
									if(jQuery.fn.hasClass(k,clss)){
										nodes.push(k);
									}
								},res);
								res=nodes;
							}
							
							return res;
						}


					//选择器字符集
					}else{
						var list;
						var res=jQuery.select(ary[0],cxt);
						for(var i=0;i<ary.length-1;i++){
							list=[];
							jQuery.fn.each(function(k1,i1){
								list.push([].slice.call(jQuery.select(ary[i+1],k1)));
							},res);
							res=Array.prototype.concat.apply([],list);
						}
						
						return res;
					}
				}else if(typeof sel ==="object"){

					if(sel instanceof Array||sel.length){
						return sel;
					}else if(sel.nodeType){
						return [sel];
					}
				}else if(typeof sel === "function"){

						if (document.addEventListener){
							document.addEventListener( "DOMContentLoaded", sel, false ); 
						} 

				}
				return this;
			},
			
			makeArray:function(nodelist){
				this.nodelist=nodelist;
				this.length=nodelist.length
				return this;
			}
		});

		//函数工具
		jQuery.fn.extend({
	
			each:function(fn,data){
				
				if(!arguments.length)return this;

				var i=0;
				data=data||that.nodelist;
				if(data instanceof Array){

					for(i=0,len=data.length;i<len;i++){
					//	console.debug(len,data);
						fn.call(this,data[i],i);
					}
				}else{
					for(var k in data){
						fn.call(this,data[k],i,k);
						i++;
					}	
				}
				
				return this;
			}
		});

		jQuery.fn.extend({
			eq:function(){
				return $(this.nodelist[num]);
			},
			get:function(num){
				return this.nodelist[num];
			},
			siblings:function(sel){
				sel=sel||"";
				var doms=this.child(sel,this.nodelist[0].parentElement);
				var res=[];
				for(var i=0,k;i<doms.nodelist.length;i++){
					k=doms.nodelist[i];
					if(k!=this.nodelist[0]){
						res.push(k)
					}
				}
				this.siblings=$(res);
				return this.siblings;
			},
			child:function(sel,cxt){
				if(arguments.length===0){
					sel="";
				}
				var ele=cxt||this.nodelist[0];
				var child=ele.children;
				var res=[];
				

				for(var i=0;i<child.length;i++){
					if(typeof sel!=="number"&&sel!==''&&!$(child[i]).hasClass(sel)){
						continue;
					}
					child[i].nodeIndex=i;
					res.push(child[i]);
				}
				var res=$(typeof sel!=="number"?res:res[sel]);
				jQuery.setCache.call(res,this.selector+" :child("+sel+")",res);
				res.$parent=this;
				return res;
			},
			index:function(){
				return 1;
			}
		})

		//dom操作
		jQuery.fn.extend({
			css:function(){
				var a=arguments;
				var sty="";
				var ary=[];

				//使用cssText前先拼接css样式
				if(a.length>1){
					sty=a[0]+":"+a[1];
				}else if(typeof a[0] ==="string"){
					if(/:/.test(a[0])){
						sty=a[0];
					}else {
						//参数只有一个，并且不包含:则获取其this.nodelist/this.nodelist[0]的a[0]属性
						return jQuery.fn.getStyle(this.nodelist.length?this.nodelist:this.nodelist[0],a[0])
					}
				
				}else{
					jQuery.fn.each(function(v,i,k){
						k=k.replace(/[A-Z]/g,function(m){
							return "-"+m.toLowerCase();
						})
						ary.push(k+":"+v);
					},a[0]);

					sty=ary.join(";");

					jQuery.fn.each(function(k,i){
						k.style.cssText+=sty;
					});
				}

				try{
					jQuery.fn.each(function(k,i){
						k.style.cssText+=sty;
					})
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
			},
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
							k.className=(!k.className?'':k.className+" ")+cls;
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
						});
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
						});
					}else if(a.length===0){
						return (this.nodelist.length?this.nodelist[0]:this.nodelist).innerHTML;
					}
				}catch(e){

				}
				return this;
			},
			append:function(tag){
				if(typeof tag==="string"){
					jQuery.fn.each(function(k,i){
						$(k).html(tag);
					})
				}
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
		});

		jQuery.fn.extend({
			on:function(){
				var a=arguments;
				var type,fn,child;
				var mod=jQuery.fn.isIE();
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
						if(mod){
							k.attachEvent("on"+type[n],function(e){

								e.target=e.srcElement;
								console.log(this);
								e.pageX=this.nodelist[0].offsetLeft
								e.pageY=this.nodelist[0].offsetTop;
								fn.call(k,e)
							});
						}else{
							k.addEventListener(type[n],function(e){
								e=window.event;
								e.pageX=e.target.offsetLeft
								e.pageY=e.target.offsetTop;
								fn.call(k,e)
							});
						}
					})
				}
			}
		})

		jQuery.fn.extend({
			support:function(){

			},
			isIE:function(){
				return !!window.attachEvent;
			}
		})
		//用jQuery的原型替代jQuery实例的原型
		jQuery.fn.init.prototype=window.jQuery.prototype;
		
	})(window,document);