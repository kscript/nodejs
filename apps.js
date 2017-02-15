/**
 * Created by yanfa on 2016/9/13.
 */
var fs = require("fs");
var http = require('http');
var url = require('url');
var session = require('session');
var query = require("querystring");    //解析POST请求
var sys=require("./demo/sys.js");
var sql=require("./demo/sql.js");
var headInfo=sys.headInfo;
sys.fs=fs;
global.TREE={
    method:"GET",
    data:{}
};
global.$_GET={};
global.$_POST={};
global.log=global.console.err= function() {
    var obj = {};
    var a=[].slice.call(arguments);
    Error.captureStackTrace(obj,console.err);
    a.push(" \r\n"+obj.stack.match(/\(([\s\S]*?)\)/)[1]);
    console.log.apply(null,a);
    return a;
};
sys.assign("url","/");

http.createServer(function (req, res) {
    var that=this;
    var link=url.parse(req.url,true);
    var conf,step,status,type;

    sys.media.id=url.parse(req.url,true).query['id'];
    TREE.method=req.method;
    conf={
        path:link.path,
        urldata:link.path,
        method:req.method,
        header:{
            code:200,
            status:0,
            type:{'Content-Type': 'text/html;charset=utf-8'}
        }
    };

    step = function() {
        return new Promise(function (resolve, reject) {
            //设置http访问请求头信息
            sys.test(link.path,function (_type,_path,_status) {
                type=_type;
                link.path=_path;
                status=_status;
            });
            if(status!==1){
                if(headInfo[type]){
                    res.writeHead(200, {'Content-Type': headInfo[type]+(/ttf|woff/.test(type)?"":";charset=utf-8")});
                    fs.readFile(sys.path+link.path, function (err, data) {
                        if(/html|css|js/.test(type)){
                            try{
                                res.end(sys.tpl(data.toString(),sys.media));
                            } catch(e) {
                                console.err(link.path);
                            }

                        }else{
                            res.end(data);
                        }
                    });
                }else{
                    res.writeHead(404);
                }
            }

            reject();
        });

    };

    if(req.method == "GET"){
        Servers(res,req,conf);
        step();
    }else{
        var postdata = "";
        req.addListener("data",function(post){
            postdata += post;
        });
        //POST结束输出结果
        req.addListener("end",function(){
            conf.urldata=postdata;
            Servers(res,req,conf);
        })
    }

}).listen(8888);

function Servers(res,req,conf){
    var ctrl;
    var header=conf.header;

    TREE.data=conf.urldata
    TREE.json=query.parse(conf.urldata);
    if(/^get$/i.test(conf.method)){
        $_GET=TREE.data;
    }else{
        $_POST=TREE.data;
    }

    var mvc=sys.route(conf.path);
    //0 首页 1 资源路径 2 路由
    var mod=mvc.length?2:mvc;
    if(mod!==1){

        if(mod==0){
            //为空时的默认控制器、动作
            mvc=['index','index'];
        }else{
            //填充缺省值
            mvc=sys.extend(mvc,['index','isEmpty',null]);
            //控制器不存在时
            if(!mvc[0]){
                header.text='<title>error #101</title>控制器错误~';
                return ;
            }
        }

        try{
            //调用控制器
            ctrl=require(sys.path+'controller/'+mvc[0]+'Controller.node.js');

            //设置传递给控制器的变量
            sys.extend({
                level:2,
                header:header,
                http:res,
                sys:sys,
                fs:fs,
                sql:sql,
                assign:function(){
                    sys.assign.apply(sys,arguments);
                },
                isEmpty:function (text) {
                    //默认动作方法
                    header.text=text||'';
                    res.writeHead(header.code,header.type);
                    res.end(header.text);
                },
                html:function(html){
                    res.writeHead(200, {'Content-Type': 'text/html;charset=utf-8'});
                    res.end(html);
                },
                show:function(message,type,code){
                    res.writeHead(code||200, {'Content-Type': (sys.headInfo[type]?sys.headInfo[type]:'text/html')+';charset=utf-8'});
                    res.end(message);
                },
                display:function (path,json,dir) {
                    //加载模板并显示 参数说明：1模板路径 2需要替换的json数据
                    json=json||sys.media;
                    var url=sys.path+path;
                    url=dir||url;
                    if(arguments.length==3){
                        http.get(url, function(results) {
                            results.on("data", function(data) {
                                if(data){
                                    res.end(sys.tpl(data.toString(),json));
                                }
                            });
                        });

                    }else{
                        try{

                            res.writeHead(200, {'Content-Type': 'text/html;charset=utf-8'});
                            fs.readFile(url, function (err, data) {
                                try{
                                    res.end(sys.tpl(data.toString(),json));
                                } catch(e) {
                                    console.err(e);
                                }
                            });
                        }catch(e){
                            console.err(e);
                        }
                    }
                    return '';

                },
                $:function(){
                    return ctrl;
                }
            },ctrl);

            try{
                //执行动作
                ctrl[mvc[1]](mvc[2]);
                header.status=1;
            }catch(e){
                //执行动作时出错
                header.text='<title>error #102</title>当前动作不存在~';
            }
        }catch(e){
            //控制器不存在
            header.code=404;
            header.text='';//'<title>error #101</title>控制器错误~';
        }
        if(header.status!==1){

            //如果没有成功执行动作则显示提示页面
            //display_error 是否提示错误
            res.writeHead(header.code, header.type);
            res.end(sys.display_error?header.text:'');
        }
    }
}
// 终端打印如下信息
console.err('Server running at http://127.0.0.1:8888/?');

var WebSocketServer = require('ws').Server,
    wss = new WebSocketServer({
        port: 80
    });
wss.broadcast = function broadcast(s,ws,obs) {

    obs&&console.err(obs);
    //服务器向客户端推送消息
    wss.clients.forEach(function each(client) {
        if(s == 1){
            //客户端自己
            if(ws.type==1&&wss.kid!==client.kid){
                ws.type=0;
                var data=JSON.stringify(ws);
                ws.type=1;
                client.send(data);
                return;
            }

            client.send(JSON.stringify(ws));
        }

        if(s == 0){
            client.send(ws + "退出聊天室");
        }
    });
};

wss.on('connection', function(ws) {

    ws.send('你是第' + wss.clients.length + '位');

    wss.clients[wss.clients.length-1].kid=wss.clients.length-1;

    // 发送消息
    ws.on('message', function(jsonStr,flags) {

        var obj = eval('(' + jsonStr + ')');
        wss.kid=this.kid;
        //console.err(Object.keys(ws));
        wss.broadcast(1,obj,wss.clients._ultron);
    });
    // 退出聊天
    ws.on('close', function(close) {
        try{
            wss.broadcast(0,this.user.name);
        }catch(e){
            console.err('刷新页面了');
        }
    });
});


function socketVerify(info) {
    console.err(info);
}