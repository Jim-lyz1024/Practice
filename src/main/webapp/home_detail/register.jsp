<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/12/2021
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <base href="http://114.55.145.59:80/rctms/">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/base.css">
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/base.js"></script>
    <script type="text/javascript">

        $(function(){

            $(".success").hide(); //页面初始化，先隐藏

            //用户名失去焦点
            $("#user").blur(function(){
                if($(this).val()!=""){
                    $.ajax({
                        url:"home/queryCompanyCountByName",
                        type:"post",
                        dataType:"json",
                        data:{
                            userName:$("#user").val()
                        },
                        success:function(result){
                            if(result.message=="exist"){
                                $("#user").val("");
                                $(".msg").eq(0).text("用户名已被注册过")
                            }else if(result.message=="noexist"){
                                $(".msg").eq(0).text("可以注册")
                            }
                        }
                    });
                }else{
                    $(".msg").eq(0).text("用户名不许为空")
                    $(this).val("");
                }
            });

            //企业名失去焦点
            $("#comName").blur(function(){
                if($(this).val()!=""){
                    $.ajax({
                        url:"home/queryCompanyCountByComName",
                        type:"post",
                        dataType:"json",
                        data:{
                            comName:$("#comName").val()
                        },
                        success:function(result){
                            if(result.message=="exist"){
                                $("#comName").val("");
                                $(".msg").eq(1).text("企业名已被注册过")
                            }else if(result.message=="noexist"){
                                $(".msg").eq(1).text("可以注册")
                            }
                        }
                    });
                }else{
                    $(".msg").eq(1).text("企业名不许为空")
                    $(this).val("");
                }
            });

            //密码失去焦点
            $("#password").blur(function(){
                if($(this).val()!=""){
                    var reg=/^(.){6,20}$/;
                    if(reg.test($(this).val())){
                        $(".msg").eq(4).text("格式正确")
                    }else{
                        $(".msg").eq(4).text("不符合规则，满足6-20位")
                        $(this).val("");
                    }
                }else{
                    $(".msg").eq(4).text("密码不允许为空")
                }
            });

            //确认密码失去焦点
            $("#surepassword").blur(function(){
                if($(this).val()!=""){
                    if($(this).val()==$("#password").val()){
                        $(".msg").eq(5).text("格式正确")
                    }else{
                        $(".msg").eq(5).text("两次密码输入不一致")
                        $(this).val("");
                    }
                }else{
                    $(".msg").eq(5).text("密码不允许为空")
                }
            });

            //手机号失去焦点
            $("#telephone").blur(function(){
                if($(this).val()!=""){
                    var reg = /^1(3[0-9]|4[5,7]|5[0,1,2,3,5,6,7,8,9]|6[2,5,6,7]|7[0,1,7,8,6]|8[0-9]|9[1,8,9])\d{8}$/;
                    if(!reg.test($("#telephone").val()) || !$("#telephone").val().length==11){
                        //	$("#telephone").val("");
                        $(".msg").eq(6).text("手机号格式不正确")
                    }else{
                        $.ajax({
                            url:"home/checkTelephone",
                            type:"post",
                            dataType:"json",
                            data:{
                                telephone:$("#telephone").val()
                            },
                            success:function(result){
                                if(result.message=="exist"){
                                    $("#telephone").val("");
                                    $(".msg").eq(6).text("手机号已被注册过")
                                }else if(result.message=="noexist"){
                                    $(".msg").eq(6).text("可以注册")
                                }
                            }
                        });
                    }
                }else{
                    $(".msg").eq(6).text("手机号不允许为空")
                }
            });

            //发送验证码
            $("#createCode").click(function(){
                if($("#telephone").val()!=""){
                    //生成验证码
                    $.ajax({
                        url:"home/createMsgCode",
                        type:"post",
                        dataType:"json",
                        data:{
                            telephone:$("#telephone").val()
                        },
                        success:function(result){
                            if(result.message=="success"){
                                var num=60
                                $("#createCode").attr("disabled",true);
                                var t=setInterval(function() {
                                    if(num<=0){
                                        $("#createCode").html("获得验证码");
                                        $("#createCode").attr("disabled",false);
                                        clearInterval(t)
                                        return;
                                    }
                                    $("#createCode").html(num--+"秒")

                                }, 1000);
                            }else{
                                $(".msg").eq(7).text("发送失败")
                            }
                        }
                    });
                }
                else{
                    $(".msg").eq(6).text("手机号不允许为空")
                }
            });


            //注册
            $("#but1").click(function(){
                $(".msg").text("")
                var result=false;
                if($("#user").val()==""){
                    $(".msg").eq(0).text("用户名不许为空")
                    result=true;
                }
                if($("#comName").val()==""){
                    $(".msg").eq(1).text("企业名称不许为空")
                    result=true;
                }
                if($("#management").val()==""){
                    $(".msg").eq(2).text("主营项目不许为空")
                    result=true;
                }
                if($("#contacts").val()==""){
                    $(".msg").eq(3).text("联系人不许为空")
                    result=true;
                }
                if($("#password").val()==""){
                    $(".msg").eq(4).text("密码不许为空")
                    result=true;
                }
                if($("#surepassword").val()==""){
                    $(".msg").eq(5).text("确认密码不许为空")
                    result=true;
                }
                if($("#telephone").val()==""){
                    $(".msg").eq(6).text("手机号不许为空")
                    result=true;
                }
                if($("#code").val()==""){
                    $(".msg").eq(7).text("验证码不许为空")
                    result=true;
                }
                if(!result){
                    $.ajax({
                        url:"home/verifyMsgCode",
                        type:"post",
                        dataType:"json",
                        data:{
                            msgCode:$("#code").val()
                        },
                        success:function(result){
                            if(result.message=="success"){ //通过
                                $.ajax({
                                    url:"home/register",
                                    type:"post",
                                    dataType:"json",
                                    data:{
                                        userName:$("#user").val(),
                                        password:$("#password").val(),
                                        telephone:$("#telephone").val(),
                                        comName:$("#comName").val(),
                                        management:$("#management").val(),
                                        contacts:$("#contacts").val()
                                    },
                                    success:function(result){
                                        if(result.message=="error"){
                                            $(".msg").eq(7).text("注册失败")
                                        }else if(result.message=="success"){
                                            //$(".msg").eq(7).text("注册成功")
                                            $(".reg").hide();
                                            $(".success").show();
                                            //window.location.href="home_detail/login.jsp"
                                        }
                                    }
                                });
                            }else if(result.message=="delayed"){ //过期
                                $(".msg").eq(7).text("验证码已过期，请重新发送")
                                $("#code").val("");
                            }else if(result.message=="error"){ //验证未通过
                                $(".msg").eq(7).text("验证码不正确")
                                $("#code").val("");
                            }
                        }
                    });
                }
            });
        });

        //避免缓存
        function myRefersh(e) {
            var source = e.src ; // 获得原来的 src 中的内容
            var date = new Date(); // 创建一个 Date 对象的 一个 实例
            var time = date.getTime() ; // 从 新创建的 Date 对象的实例中获得该时间对应毫秒值
            e.src =source+"?time=" + time ; // 将 加了 尾巴 的 地址 重新放入到 src 上
        }
    </script>
</head>
<body>
<!--头部-->


<%@include file="header.jsp"%>
<div class="modalfom reg container">
    <h3>企业注册</h3>
    <form  class="row">
        <div class="row">
            <label class="col-sm-3 control-label">用户名</label>
            <div class="col-sm-9 fom row">
                <div class="col-sm-1 hidden-xs"><img src="img/login1.jpg" ></div>
                <div class="col-sm-10"><input type="text" id="user"  name="user" placeholder="请输入用户名称" ></div>
            </div>
        </div>
        <p class="msg"></p>
        <div class="row">
            <label class="col-sm-3 control-label">企业全称</label>
            <div class="col-sm-9 fom row">
                <div class="col-sm-1 hidden-xs"><img src="img/login3.jpg" width="15px" height="20px"></div>
                <div class="col-sm-10"><input type="text" id="comName" name="comName" placeholder="输入企业全称"></div>
            </div>
        </div>
        <p class="msg"></p>
        <div class="row">
            <label class="col-sm-3 control-label">主营项目</label>
            <div class="col-sm-9 fom row">
                <div class="col-sm-1 hidden-xs"><img src="img/login3.jpg" width="15px" height="20px"></div>
                <div class="col-sm-10"><input type="text" id="management" name="" placeholder="输入主营项目"></div>
            </div>
        </div>
        <p class="msg"></p>
        <div class="row">
            <label class="col-sm-3 control-label">联系人</label>
            <div class="col-sm-9 fom row">
                <div class="col-sm-1 hidden-xs"><img src="img/login1.jpg" ></div>
                <div class="col-sm-10"><input type="text" id="contacts"  name="" placeholder="请输入联系人" ></div>
            </div>
        </div>
        <p class="msg"></p>
        <div class="row">
            <label class="col-sm-3 control-label">密 码</label>
            <div class="col-sm-9 fom row">
                <div class="col-sm-1 hidden-xs"><img src="img/login2.jpg" ></div>
                <div class="col-sm-10"><input type="password" id="password"  name="password" placeholder="设置6到20位登录密码"></div>
            </div>
        </div>
        <p class="msg"></p>
        <div class="row">
            <label class="col-sm-3 control-label">确认密码</label>
            <div class="col-sm-9 fom row">
                <div class="col-sm-1 hidden-xs"><img src="img/login2.jpg" ></div>
                <div class="col-sm-10"><input type="password" id="surepassword"  name="password" placeholder="设置6到20位登录密码"></div>
            </div>
        </div>
        <p class="msg"></p>
        <div class="row">
            <label class="col-sm-3 control-label">手机号</label>
            <div class="col-sm-9 fom row">
                <div class="col-sm-1 hidden-xs"><img src="img/login3.jpg" width="15px" height="20px"></div>
                <div class="col-sm-10"><input type="text" id="telephone" name="telephone" placeholder="输入手机号"></div>
            </div>
        </div>
        <p class="msg"></p>
        <div class="row">
            <label class="col-sm-3 control-label">短信验证码</label>
            <div class="col-sm-9 fom row">
                <div class="col-sm-8 col-xs-6">
                    <div class="col-sm-1 hidden-xs paddingiocn"><img src="img/login4.jpg" width="17px" class="emailicon"></div>
                    <div class="col-sm-7 col-xs-8"><input type="text" name="code" id="code" placeholder="输入验证码"></div>
                    <div class="col-sm-4 col-xs-4" ><button type="button" id="createCode" class="btn btn-default">获得验证码</button></div>
                </div>
            </div>
        </div>
        <p class="msg"></p>
        <div class="row">
            <label class="col-sm-2 control-label"></label>
            <div class="col-sm-10">
                <button type="button" id="but1" class="btn btn-primary btn-lg btn-block">注 册</button>
            </div>
        </div>
    </form>

</div>
<!-- 注册成功 -->
<div class="modalfom success container">
    <h3>注册成功</h3>
    <div class="row">
        <div class="col-sm-12">
            <img src="img/success.png">

        </div>
        <p>企业注册成功</p>
        <p>请牢记用户名密码</p>
        <div class="col-sm-12 row">
            <div class="col-sm-6">
                <button type="button" class="btn btn-primary btn-lg btn-block" id="but3" onclick="window.location.href='home_detail/login.jsp';">确 定</button>
            </div>
            <div class="col-sm-6">
                <button class="btn1" onclick="qqzx()"><img src="img/qq.png" width="28px" height="28px">在线询价</button>
            </div>
        </div>
    </div>
</div>
<!--底部-->


<!DOCTYPE html>
<html lang="en">
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
                        <img class="wximage" src="img/wei.png" >
                        <p>微信在线客服</p>
                    </div>
                    <div class="col-md-6 ph">
                        <img class="whatsupimage" src="img/wei.png" >
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

</body>
</html>