<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 18/12/2021
  Time: 14:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>底部</title>
    <script type="text/javascript">
        $(function(){
            //页脚信息展示
            $.ajax({
                url:"home/queryPagefooter",
                type:"get",
                dataType:"json",
                success:function(result){
                    if(result.message=="success"){
                        $.each(result.obj,function(key,homeInfo){
                            if(homeInfo.contentType==3){
                                $(".wximage").attr("src",homeInfo.imageUrl);
                            }
                            if(homeInfo.contentType==4){
                                $(".whatsupimage").attr("src",homeInfo.imageUrl);
                            }
                            if(homeInfo.contentType==2){
                                $("#qqNo").val(homeInfo.content);
                            }

                        });
                    }
                }
            });
        });
    </script>
</head>
<body>
<div id="footer">
    <div class="container" >
        <div class="row">
            <div class="col-md-6 bth">
                <div class="row">
                    <div class="col-md-6 ph">
                        <img class="wximage" src="../img/QRcode.png" >
                        <p>微信在线客服</p>
                    </div>
                    <div class="col-md-6 ph">
                        <img class="whatsupimage" src="../img/mobilenet.png" >
                        <p>移动端网站（手机）</p>
                    </div>
                    <input type="hidden" id="qqNo"/>
                </div>
            </div>
            <div class="col-md-6 about">
                <h4>联系我们 <span>Contact</span> </h4>
                <div class="row">
                    <div class="col-md-6">
                        <p>地址：黑龙江省哈尔滨市西大直街XXXX号</p>
                        <p>邮编：150000</p>
                        <p>电话：0451-88886666</p>
                    </div>
                    <div class="col-md-6">
                        <p>手机：18088886666 / 18088886666</p>
                        <p>传真：0451-88886666</p>
                        <p> 邮箱：XXXXXXX@163.com</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom">
        <p>
            <span>CopyRight © 2021</span>
            <span>中俄贸易供需服务平台</span>
            <span>XXXX.com All Rights Reserved</span>
            <span>备案：ICP备8888888号</span>
        </p>
    </div>
</div>

</body>
</html>

<!--咨询菜单-->


<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>咨询菜单</title>
    <script type="text/javascript">
        /*function qqzx(){
            window.location.href="tencent://message/?uin="+$("#qqNo").val()+"&Menu=yes";
        }*/
    </script>

</head>
<body style="background:transparent;">
<div class="contact">
    <div class="scrolltop host">
        <img src="../img/touch1.png" width="30px" height="30px" class="hidden-xs">
        <p>返回顶部</p>
    </div>
    <div class="follow host">
        <img src="../img/touch2.png" width="31px" height="25px" class="hidden-xs">
        <p>微信客服</p>
        <div class="elevator ">
            <h5>即时通讯</h5>
            <p class="hidden-xs">1v1客服即时沟通</p>
            <img class="wximage" src="../img/QRcode.png" >
            <p class="hidden-xs">微信扫一扫关注</p>
            <p class="hidden-xs">或搜素关注：中俄贸易供需服务平台</p>
        </div>
    </div>
    <div class="host hidden-xs" onclick="qqzx();">
        <img src="../img/touch3.png" width="31px" height="25px">
        <p>QQ咨询</p>
        <input type="hidden" id="qqNo"/>
    </div>
    <div class="follow host">
        <img src="../img/touch4.png" width="31px" height="25px" class="hidden-xs">
        <p>What'sup</p>
        <div class="elevator">
            <h5>What'sup</h5>
            <p class="hidden-xs">1v1客服即时沟通</p>
            <img class="whatsupimage" src="../img/QRcode.png" >
            <p class="hidden-xs">What'sup扫一扫关注</p>
            <p class="hidden-xs">或搜素关注：中俄贸易供需服务平台</p>
        </div>
    </div>

</div>

</body>
</html>
<script>
    //保存查询条件行业类型
    var g_businessId;
    //按模板填充数据
    function getRowHtml(order){
        var trade =  "进行中";
        var className="state1";
        if(order.tradeflag == "1"){
            trade =  "已完成";
            className="state";
        }
        var strRow  ='<div class="row">'
            +'    <div class="col-sm-4" >'
            +'        <img src="homeImages/'+ order.img1  +'"  class="img-responsive">'
            +'    </div>'
            +'    <div class="col-sm-8">'
            +'        <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp?orderid='+order.orderid+'">'
            +         order.orderNamech +'</a></h4>'
            +'        <span>'+ order.orderNameen +'</span>'
            +'        <p>'+ order.summary +'</p>'
            +'        <div class="deail">'
            +'            <p class="date">'+ order.publishtime +'</p>'
            +'            <p class='+className+'>订单状态：'+ trade +'</p>'
            +'            <p><object data="img/ched.svg" width="19" height="16"  ></object>'
            +'                '+ order.businessName +'</p>'
            +'        </div>'

            +'    </div>'
            +'</div>';
        return strRow;

    }
    //创建分页工具栏
    function createPageBar(obj){

        strBar =
            ' <div class="pagelist">'
            +'    <ul class="nav  nav-pills">'

            +'         <li><a href="#" onclick="displaySupplyList('+ (obj.pageNum-1) +');return false;"> < </a></li>';
        if(obj.navigatepageNums){
            for(i=0;i<obj.navigatepageNums.length;i++){
                var tempactive = "";
                if((obj.navigatepageNums[i])== obj.pageNum){
                    tempactive ="class=active";
                }
                strBar = strBar + ' <li '+ tempactive +'><a href="#" onclick="displaySupplyList('+ (obj.navigatepageNums[i]) +');return false;">'+ obj.navigatepageNums[i] +'</a></li>';
            }
        }
        strBar = strBar
            +'         <li><a href="#" onclick="displaySupplyList('+ (obj.pageNum+1) +');return false;"> > </a></li>'
            +'     </ul>'
            +'  </div>';

        return strBar;
    }

    function getQueryParam(paramName)
    {
        //alert("获得请求参数");
        var query =decodeURI(window.location.search).substring(1);

        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == paramName){
                return pair[1];
            }
        }
        return(false);
    }
    //获得ajax请求数据,生成列表html
    function createList(url,method,id){
        var listHtml = "";
        $.ajax({
            url:url,
            type:method,
            dataType:"json",
            success:function(result){
                if(result.message=="success"){
                    //解析ajax响应结果，填充模板
                    $.each(result.obj.list,function(key,order){
                        listHtml = listHtml + getRowHtml(order);
                    });
                    listHtml = listHtml + createPageBar(result.obj);
                    //使用模板渲染页面节点
                    $(id).html(listHtml);
                }
            }
        });

    }

    function displaySupplyList(pageNum){
        //按页码查询。默认第一页
        params = "?";
        if(!pageNum){
            pageNum="1";
        }
        //判断是否按行业查询
        var businessid = getQueryParam("businessid");
        //alert("businessid  "+businessid);
        if(businessid){
            g_businessId = businessid;
        }
        params = params + "pageNum="+pageNum;
        if(g_businessId){
            params = params + "&businessid="+g_businessId;
        }
        var url="home/homeSupplyOrderList"+params;
        //alert(url);
        var method="GET";
        var id = "#orderlist";

        createList(url,method,id)
    }

    //按行业查询订单列表  本页按行业查询
    function findOrdersByBusinessId(businessid){

        g_businessId = businessid;
        displaySupplyList(1);

    }


    //初始化页面
    $(function(){

        displaySupplyList(1);

        //获取行业分类名称
        var businessName = getQueryParam("businessName");
        if(businessName!=false){
            $("#businessName").html(">> "+businessName);
        }
    });

</script>
