/**
 * Created by yanfa on 2016/11/22.
 */

module.exports={
    index:function (url) {
        if(url){
            this.http.setHeader("Access-Control-Allow-Origin", "*");
            try{
                if(/:/.test(url)){
                    var ary=url.split(":");
                    url=ary[0];
                    var chatId=ary[1];
                    //这里是一个聊天室的demo 使用了冒号将url分解为demo地址和要发起的聊天ID号;
                    //chat:12345
                    if(url==="chat"){
                        this.assign("myId",1);
                        this.assign("chatId",chatId);
                        console.log("向id:"+chatId+"发起聊天请求");
                    }
                }
                this.display(this.sys.root+"demo/"+url+".html");
                return ;
            }catch(e){
                console.err(e,this.sys.root+"demo/"+url+".html");
            }

        }
        console.err(this.sys.root+"demo/"+url+".html")
        this.html("当前页面不存在");
    }
};