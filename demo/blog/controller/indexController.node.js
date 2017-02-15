/**
 * Created by yanfa on 2016/11/22.
 */

module.exports={
    index:function (id) {
        var that=this;
        //模拟thinkphp绑定模板变量

        //模拟从数据库取到的json数据
        //模板设置<node key="test" type="each">
        //key绑定sys.media的key（前缀）
        that.assign('test',[{
            text:123
        },{text:456
        }],1);

        that.sql.Client.query("select * from " + that.sys.db,function(err,data){
            that.assign("article",data,1);
            //读数据库是异步的？
            //此处不允许超出项目根目录，故使用相对路径
            that.display('/view/index.html',false);
        });

    },
    article:function(id){
        var that=this;
        try{
            id=parseInt(id);
            that.assign({
                id:id,
                uid:1
            });

            that.assign("page",[{
                'pageno': 1
            },{
                'pageno': 2
            }],1);
            that.sql.Client.query('update '+that.sys.db +" set view = view +1 where id ="+id);

            that.sql.Client.query("select * from " + this.sys.db +" where id ="+id,function(err,data){
                if(data){
                    data[0].cls='read-article';
                    that.assign("article",data,1);
                    that.sql.select({id:id},function(err,res){
                        that.assign("replys",res,1);
                        that.display('/view/article.html',false);
                    })

                }else{
                    that.isEmpty('当前文章不存在');
                }

            });

        }catch(e){

        }
    },
    tag:function (tag) {
        var that=this;
        tag=decodeURIComponent(tag);
        var sql="select * from " + this.sys.db +" where tag like '%"+tag+"%'";
        that.sql.Client.query(sql,function(err,data){
            if(data){
                that.assign("article",data,1);
                that.display('/view/index.html');
            }else{
                that.isEmpty('当前文章不存在');
            }

        });
    },
    api:function(type){
        var that=this;
        if(/^POST$/i.test(TREE.method)){
            var obj=TREE.json;

            that.sql.insert(obj,function(err,res){
                res.time=that.sys.fn.datatime(res,res.time);
                that.html(JSON.stringify(res));
            });
            //that.sql.Client.query();
        }
    },
    create:function(){
        this.display('/view/create.html');
    },
    help:function(){
        this.display('/view/help.html');
    },
    test:function(){
        this.display('/view/test.html');
    }
};