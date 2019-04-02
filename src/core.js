/**
 * Created by yanfa on 2016/11/16.
 */
module.exports={
    db:'app',//当前使用的主数据库表
    path:"./src/blog/",//网站根路径
    html:"./src/blog/view/index.html",//动态数据的模板
    index:"view/index.html",//默认首页
    root:"/view/",
    prefix:'fix_',
    tag_parse:/<node\s([\s\S]*?)<\/node>/g,
    tag_parse_end:/>([\s\S]+)<\/node>/,
    val_parse:/\{~([a-zA-Z0-9][\s\S]*?)\}/g,
    tpl_parse:/{tpl:(.*?)}/g,
    fn:{
        setTag:function(){
            var a=arguments;
            var res='';
            var ary=a[1].split(",");
            this.each(ary,function(k,i,s){
                res+="<a href='/index/tag/{~"+i+"}'>"+k+"</a>"
            });
            return this.tpl(res,ary);
        },
        datatime:function(){
            var a=arguments;
            var time=new Date(parseInt(a[a.length==1?0:1]));
            var tmp=time.getFullYear()+"-"+(time.getMonth()+1)+"-"+time.getDate()+ " " +time.getHours()+":"+time.getMinutes()+":"+time.getSeconds();
            return tmp;
        }
    },//模板函数集
    headInfo:{
        css:"text/css",
        html:"text/html",
        jpg:"image/jpg",
        png:"image/png",
        gif:"image/gif",
        ico:"image/x-icon",
        js:"text/javascript",
        json:"text/javascript",
        mp3:"audio/mp3",
        woff:"",
        ttf:""
    },
    file:'pub',//在此定义文件路径，与其同名的路由控制器将被忽略
    media:{
        //相对于项目的根目录(core.path),不是nodejs程序的根目录
        //使用路由时./pub/会被浏览器当做./控制器/pub/ 只好/pub/这样
        js:'/pub/js/',
        css:'/pub/css/',
        img:'/pub/img/',
        media:'/pub/media/',
        ueditor:"/pub/Ueditor/",
        html:"./",
        user:"admin",
        context:"test"
    },
    //检测路径 获知将要输出文件的类型
    test:function (str,fn,mod) {
        mod=0;
        //如果url是/或为空或纯传参

        if(str=="/"||str==''||str.indexOf("/?")==0){
            // 设置header类型为html
            type="html";
            //  将路径设置为默认首页地址
            str=this.index;
            mod=1;
        }else{
            //  根据后缀设置header类型
            type=str.match(/\.([^\.]+$)/);

            if (type && type.length) {
                type=type[1];
                type=type.split("?")[0];
            }
        }
        // 通过回调函数将header类型及路径返回回去
        fn.call(null,type,str,mod);
    },
    //前者覆盖后者
    extend:function (source,target) {
        this.each(source,function (k,i) {
            target[i]=source[i];
        });
        //for(var key in source)target[key] = source[key];
        return target;
    },
    tpl:function (html,data,status) {
        var that=this;
        try{
            //1解析引入的模板
            html=html.replace(that.tpl_parse,function(s,m){
                return that.fs.readFileSync(that.path+m,"utf-8");
            });
            //2先替换标签再替换标签外的模板变量
            html=html.replace(that.tag_parse,function (s,m) {
                var ary=m.split(">");
                ary[1]=m.substr(ary[0].length+1,m.length);
                //将node标签的属性转为json数据
                var jsons=ary[0].replace(/(=| |')/g,function(a,b){
                    return {
                        "=":'":',
                        " ":',"',
                        "'":'\\"'
                    }[b]
                });
                var obj=JSON.parse('{"'+jsons+'}');
                //解析模板变量，key不存在时返回空数据
                return that.parseTpl(obj,s,ary);
            });

            html= html.replace(that.val_parse,function (s,m) {
                //暂时只渲染单个模块变量 不解析空格后面的数据
                var ary=m.split("|");
                var args=[];
                m=ary[0];

                if(ary.length>1){
                    try{
                        if(ary.length==3){
                            args=ary[2].split(",");
                        }

                        args.unshift(ary[0],data[ary[0]]);
                        return that.fn[ary[1]].apply(that,args);
                    }catch(e){

                    }

                }

                return data[m]===undefined?'':data[m];

            });

            return html;
        } catch(e) {
            return '';
        }
        return '';
    },
    parseTpl:function (data,source,ary) {
        var tpl='';
        var res='';
        var that=this;
        var tmp=that.media[that.prefix+data.key];
        if(!tmp||tmp.length==0)
        {
            if(data.type==='empty'){
                return ary[1];
            }else{
                return '';
            }
        }

        try{
            if(that.isNull(tmp)){
                return source;
            }else{
                switch(data.type){
                    case 'each':
                        tpl=source.match(that.tag_parse_end)[1];
                        /*res+=that.tpl(source,that.media['d_'+data.key]);*/
                        if(tmp instanceof Array){
                            that.each(tmp,function(k,i,s){
                                res+=that.tpl(tpl,k);
                            });
                        }else{
                            res+=that.tpl(source,tmp,1);
                        }

                        break;
                    case 'empty':

                        break;
                    default:
                        return source;
                        break;
                }
                return res;
            }
        }catch(e){
            console.err(e,that);
        }
        return '';

    },
    //用于绑定自定义的数据 三个参数时为加前缀（用于模板标签<node>填数据）
    assign:function () {
        var a=arguments;
        if(a.length==2){
            this.media[a[0]]=a[1];
        }else if(a.length==3){
            this.media[this.prefix+a[0]]=a[1];
        }else if(typeof a[0] === "object"){
            this.extend(a[0],this.media);
        }
    },
    route:function(url){

        url+='#';

        var char=url.charAt(1);
        var mvc=url.match(/\/(.*?)(\?|#)/);
        var res;
        //如果url为空或'/'或第二位是#(锚点)直接返回
        //url==''||url=='/'||char==='#'
        if(mvc[1]===''||mvc[1]===null){

            if(char==='?'){

                res='{"'+url.match(/\?(.*?)#/)[1].replace(/=|&/g,function(s,m){
                    return {
                        '=':'":"',
                        '&':'","'
                    }[s]
                })+'"}';
                res=JSON.parse(res);
                var tmp=[];
                tmp[0]=res.c||'index';
                tmp[1]=res.a||'isEmpty';
                tmp[2]=res.v||null;
                //控制器 模块 参数
                return tmp;
                //常规的路由方法
            }
            return 0;
        }else{
            res=mvc[1].split('/');
            if(res[0]==this.file){
                return 1;
            }else{
                return res;
            }
        }

        //路由解析
        //url=url.match(/\/(.*?)(\?|#)/);
    },
    isNull:function (data) {

        if(typeof data==="object") {
            if (data instanceof Array) {
                return data.length === 0;
            } else {
                for (var i in data) {
                    return !!0;
                }
                return !!1;
            }
        }else{
            return !!1;
        }
    },
    each:function (data,fn){
       if(typeof data==="object") {
            if (data instanceof Array) {
                for(var i=0;i<data.length;i++){
                    fn.call(null,data[i],i,data);
                }
            } else {
                for (var i in data) {
                    fn.call(null,data[i],i,data);
                }

            }
        }else{
            fn.call(null,data,0,data);
            return data;
        }
    }
};
/*this.trace={
    101:'<title>error #101</title>控制器错误~',
    102:'<title>error #102</title>当前动作不存在~',
    201:'<title>warning #201</title>未执行任何动作~'
}*/
