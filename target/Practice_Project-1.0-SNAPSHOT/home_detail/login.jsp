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
  <!-- <base href="http://114.55.145.59:80/rctms/"> -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>登录</title>
  <link rel="stylesheet" href="../css/bootstrap.css">
  <link rel="stylesheet" href="../css/base.css">
  <script src="../js/jquery-1.10.2.js"></script>
  <script src="../js/bootstrap.js"></script>
  <script src="../js/base.js"></script>
  <script type="text/javascript">
    $(function(){

      var query =decodeURI(window.location.search);
      var s=query.split("=")[1];
      if(s==1){ //修改企业信息成功，请重新登陆
        $(".msg").text("修改成功,请重新登陆")
      }

      //用户名失去焦点
      $("#user").blur(function(){
        if($(this).val()==""){
          $(".msg").text("用户名不允许为空")
          $(this).val("");
        }
      });

      //密码失去焦点
      $("#password").blur(function(){
        if($(this).val()==""){
          $(".msg").text("密码不允许为空")
          $(this).val("");
        }
      });


      $("#but1").click(function(){
        var result=false;
        if($("#user").val()==""){
          $(".msg").text("用户名不允许为空")
          result=true;
        }
        else if($("#password").val()==""){
          $(".msg").text("密码不允许为空")
          result=true;
        }
        else if($("#code").val()==""){
          $(".msg").text("验证码不允许为空")
          result=true;
        }
        if(!result){
          //先验证验证码
          $.ajax({
            url:"home/verifyCode",
            type:"get",
            dataType:"json",
            data:{
              code:$("#code").val()
            },
            success:function(result){
              if(result.message=="error"){
                $("#code").val("");
                $(".msg").text("验证码错误")
              }else{
                $.ajax({
                  url:"home/login",
                  type:"post",
                  dataType:"json",
                  data:{
                    userName:$("#user").val(),
                    password:$("#password").val()
                  },
                  success:function(result){
                    if(result.message=="error"){
                      $(".msg").text("用户名或密码错误")
                    }else if(result.message=="success"){
                      $(".msg").text("登陆成功")
                      window.location.href="index.jsp";
                    }
                  }
                });
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
<div class="modalfom logon container">
  <h3>企业登陆</h3>

  <form  class="row">
    <p class="msg"></p>
    <div class="form-group row">
      <label class="col-sm-3 control-label">用户名</label>
      <div class="col-sm-9 fom row">
        <div class="col-sm-1 hidden-xs"><img src="../img/login1.jpg" width="18px" height="20px"></div>
        <div class="col-sm-10"><input type="text" autocomplete="off"  name="user" id="user" placeholder="请输入用户名称" ></div>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-3 control-label">密 码</label>
      <div class="col-sm-9 fom row">
        <div class="col-sm-1 hidden-xs"><img src="../img/login2.jpg" width="18px" height="20px"></div>
        <div class="col-sm-10"><input type="password" id="password"  name="password" placeholder="设置6到20位登录密码"></div>
      </div>
    </div>
    <div class="form-group row">
      <label class="col-sm-3 control-label">验证码</label>
      <div class="col-sm-9 fom row">
        <div class="col-sm-1 hidden-xs"><img src="../img/login4.jpg" width="17px" class="emailicon"></div>
        <div class="col-sm-7 col-xs-7"><input type="text" id="code" autocomplete="off" name="code" placeholder="输入验证码"></div>
        <div class="col-sm-3 col-xs-3"> <img src="../home/createCode.jpg" onclick="myRefersh(this)" width="100px" height="46px"></div>
      </div>
    </div>
    <div class="res row">
      <div class="col-sm-11"><a href="forgetpassword.jsp">忘记密码？</a></div>
    </div>
    <div class="row">
      <label class="col-sm-2 control-label"></label>
      <div class="col-sm-10">
        <button type="button" class="btn btn-primary btn-lg btn-block" id="but1">登 录</button>
      </div>
    </div>
  </form>

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
            <img class="wximage" src="../img/QRcode.png" >
            <p>微信在线客服</p>
          </div>
          <div class="col-md-6 ph">
            <img class="whatsupimage" src="../img/QRcode.png" >
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