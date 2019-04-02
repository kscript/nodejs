/**
 * Created by yanfa on 2016/11/10.
 *
 * 应该最先被调用的函数库
 *
 */
module.exports={
    extend:function (source,target) {
        for(var key in source)target[key] = source;
        return target;
    },
    tpl:function (html,data) {

        try{
            return html.replace(/\{~([a-zA-Z_$][a-zA-Z0-9_]{0,})}/g,function (s,m) {
                return data[m];
            })
        } catch(e) {
            return html;
        }
    },
    css:function (url) {
        define(["require"], function(require) {
            var cssUrl = require.toUrl(url);
            var link = document.createElement("link");
            link.type = "text/css";
            link.rel = "stylesheet";
            link.href = cssUrl;
            document.getElementsByTagName("head")[0].appendChild(link);
        });
    }
};
/*function Promise() {
    this._callbacks = [];
}

Promise.prototype.then = function(func, context) {
    var p;
    if (this._isdone) {
        p = func.apply(context, this.result);
    } else {
        p = new Promise();
        this._callbacks.push(function () {
            var res = func.apply(context, arguments);
            if (res && typeof res.then === 'function')
                res.then(p.done, p);
        });
    }
    return p;
};

Promise.prototype.done = function() {
    this.result = arguments;
    this._isdone = true;
    for (var i = 0; i < this._callbacks.length; i++) {
        this._callbacks[i].apply(null, arguments);
    }
    this._callbacks = [];
};*/
/*
var Promise = exports.Promise = function(){
    this._callbacks = [];
};

Promise.prototype.then = function(func, context){
    //处理回调结果的方法
    function doCallbackResults(r) {
        if (r instanceof Promise) {
            r.then(function(err, values){
                p.done(err, values);
            });
        } else {
            p.done(null, r);
        }
    }

    var p = new Promise();
    if (this._isdone) {
        var results = func.apply(context, this.results);
        doCallbackResults(results);
    } else {
        this._callbacks.push(function(){
            var results = func.apply(context, arguments);
            doCallbackResults(results);
        });
    }
    return p;
};

Promise.prototype.done = function(){
    this.results = arguments;
    this._isdone = true;
    for (var i=0; i<this._callbacks.length; i++) {
        this._callbacks[i].apply(null, arguments);
    }
    this._callbacks = [];
};

Promise.join = function(promises){
    var p = new Promise();
    var results = [];

    if (!promises || !promises.length) {
        p.done(results);
        return p;
    }

    var numdone = 0;
    var total = promises.length;

    function notifier(i) {
        return function() {
            numdone += 1;
            results[i] = Array.prototype.slice.call(arguments);
            if (numdone === total) {
                p.done(results);
            }
        };
    }

    for (var i = 0; i < total; i++) {
        promises[i].then(notifier(i));
    }
    return p;
};

Promise.chain = function(funcs, args) {
    var p = new Promise();
    if (!funcs || !funcs.length) {
        p.done.apply(p, args);
    } else {
        funcs[0].apply(null, args).then(function(){
            funcs.splice(0, 1);
            Promise.chain(funcs, arguments).then(function(){
                p.done.apply(p, arguments);
            });
        });
    }
    return p;
};*/
