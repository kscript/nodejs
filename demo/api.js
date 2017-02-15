/**
 * Created by yanfa on 2016/11/10.
 */
var http = require('http');
var url = require('url');
var qs = require('querystring');
var sql=require("./demo/sql.js");
http.createServer(function (req, res) {
    var link=url.parse(req.url,true);
    var local=link.query;
    res.writeHead(200, {'Content-Type': 'text/html;charset=utf-8'});
    res.end(local);
    /*sql.Client.query(local.sql,function(err,data){
        res.end(data);
    });*/
}).listen(8888);