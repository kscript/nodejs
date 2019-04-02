/**
 * Created by yanfa on 2016/11/10.
 */

var that = this;
that.config = {
    host: "localhost",
    user: "root",
    password: "root",
    database: "test",
};

that.cache = that.cache || {};


//连接数据库方法
that.link = function (conf) {

    //继承自定义属性到数据库配置
    extend(conf, that.config);

    //建立连接
    that.Client = require('mysql').createConnection(config);
    that.Client.connect();
    //选择数据库表
    that.Client.query('USE ' + that.config.database);
    that.Client.query('set names utf8');
};
that.link();
that.query = that.Client.query;
//查看数据库表
that.show = function (db) {
    that.Client.query("select * from " + db, function (err, data) {
        return data;
    });
};
that.insert = function (data, call) {
    try {
        that.Client.query('CREATE TABLE IF NOT EXISTS reply_' + data.id + ' LIKE reply');
    } catch (e) {
        console.err(e);
    }

    try {
        that.Client.query("INSERT INTO reply_" + data.id + " (`id`, `uid`, `user`, `time`, `text`,`del`) VALUES (NULL," + data.uid + ", '" + data.user + "'," + data.time + ", '" + data.text + "', '0')", function (err, res) {
            if (res) {
                data.status = 1;
                data.id = res.insertId;
                call(err, data);
            }
        });
    } catch (e) {
        console.err(e);
    }
}
that.select = function (data, call) {
    that.Client.query('select id , user , time , text from reply_' + data.id + ' order by id desc limit 0,10', function (err, res) {
        call(false, res);
    });
}

function extend(source, target) {
    for (var key in source) target[key] = source;
    return target;

};

/*
    that.create=function(sql){
        return that.Client.query(sql)
    };

    that.insert=function (db,data,fn) {
        return that.Client.query("insert into "+db+" set ?",data,fn);
    };

    that.select=function (sql,fn) {
        return that.Client.query(sql,fn);
    };

    that.delete=function (db,where,fn) {
        return that.Client.query('delete from '+db+' where '+where,fn);
    };
*/

/*
CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(11) NOT NULL DEFAULT '0',
  `user` varchar(14) DEFAULT NULL,
  `level` int(3) DEFAULT NULL,
  `power` int(3) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `text` text,
  `note` varchar(99) DEFAULT NULL,
  `tag` varchar(99) DEFAULT NULL,
  `view` int(9) DEFAULT NULL,
  `reply` int(9) DEFAULT NULL,
  `show` int(1) DEFAULT NULL,
  `del` int(1) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
*/
/*
 sql.query('CREATE TABLE blog (id INT(11) AUTO_INCREMENT,' +
 ' title VARCHAR(255), text TEXT, created DATETIME,' +
 ' PRIMARY KEY (id)) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8');

 sql.query('INSERT INTO blog SET ?', {title: 'test',text:'1111111',created:'2010-08-16 10:00:23'}, function(err, result) {
 if (err) throw err;
 console.err(result.insertId);
 });

 sql.query(
 'SELECT * FROM blog where id = 1',
 function selectCb(err, results, fields) {
 if (err) {
 throw err;
 }
 sql.res=results[0];
 console.err(results);
 web();
 console.err(fields);
 });

that.query=function (type,db,data,fn) {
    var conf={
        select:"select "
    }
    that.Client.query(some+db+conn+data,fn);
}*/
