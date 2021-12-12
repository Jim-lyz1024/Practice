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


<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>头部</title>
  <script src="../js/jquery-1.10.2.js"></script>
  <script type="text/javascript">
    $(function(){
      $.ajax({
        url:"home/queryCurrentUser",
        type:"post",
        dataType:"json",
        success:function(result){
          if(result.message=="success"){
            $(".signedin").show();
            $(".login").hide();
            if(result.obj.vipflag==0){ //非vip隐藏
              $("#vip").hide();
            }
            if(result.obj.vipflag==1){ //vip隐藏升级企业vip
              $("#vipbtn").hide();
            }
            $("#cName").html(result.obj.userName);
          }
        }
      });

      $("#out").click(function(){
        if(confirm("是否退出？")){
          $.ajax({
            url:"home/logout",
            type:"post",
            dataType:"json",
            success:function(result){
              if(result.message=="success"){
                window.location.href="index.jsp";
              }
            }
          });
        }
      });

      $("#cName").click(function(){
        window.location.href="home_detail/updateuser.jsp?userName="+$("#cName").html();
      });
    });
  </script>
</head>
<body>
<!--头部标题-->
<div id="header">
  <div  class="container" >
    <div class="row" >
      <div class="col-lg-5 col-md-12 col-xs-12 title"  >
        <img src="../img/title.png" class="img-responsive">
      </div>
      <div class="col-lg-7 col-md-12 col-xs-12 ">
        <div class="divm">
          <div> <object data="../img/u4.svg" width="21" height="21"  class="tel"></object>
            <div class="ph">
              <span>服务热线（仅收市话费）</span>
              <h4>400-0000-000</h4>
            </div>    </div>
        </div>
        <div class="login">
          <a href="login.jsp">
            <svg version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="14px" height="16px" xmlns="http://www.w3.org/2000/svg">
              <g transform="matrix(1 0 0 1 -27 -33 )">
                <path d="M 13.90703125 11.5677083333333  C 13.9690104166667 12.0920138888889  14 12.6493055555556  14 13.2395833333333  C 14 13.9965277777778  13.7721354166667 14.6458333333333  13.31640625 15.1875  C 12.8606770833333 15.7291666666667  12.3119791666667 16  11.6703125 16  L 2.3296875 16  C 1.68802083333333 16  1.13932291666667 15.7291666666667  0.68359375 15.1875  C 0.227864583333333 14.6458333333333  0 13.9965277777778  0 13.2395833333333  C 0 12.6493055555556  0.0309895833333334 12.0920138888889  0.0929687500000001 11.5677083333333  C 0.154947916666667 11.0434027777778  0.269791666666667 10.515625  0.4375 9.984375  C 0.605208333333334 9.453125  0.818489583333333 8.99826388888889  1.07734375 8.61979166666667  C 1.33619791666667 8.24131944444444  1.67890625 7.93229166666667  2.10546875 7.69270833333333  C 2.53203125 7.453125  3.02239583333333 7.33333333333333  3.5765625 7.33333333333333  C 4.53177083333333 8.22222222222222  5.67291666666667 8.66666666666667  7 8.66666666666667  C 8.32708333333334 8.66666666666667  9.46822916666667 8.22222222222222  10.4234375 7.33333333333333  C 10.9776041666667 7.33333333333333  11.46796875 7.453125  11.89453125 7.69270833333333  C 12.32109375 7.93229166666667  12.6638020833333 8.24131944444444  12.92265625 8.61979166666667  C 13.1815104166667 8.99826388888889  13.3947916666667 9.453125  13.5625 9.984375  C 13.7302083333333 10.515625  13.8450520833333 11.0434027777778  13.90703125 11.5677083333333  Z M 9.96953125 1.171875  C 10.78984375 1.953125  11.2 2.89583333333333  11.2 4  C 11.2 5.10416666666667  10.78984375 6.046875  9.96953125 6.828125  C 9.14921875 7.609375  8.159375 8  7 8  C 5.840625 8  4.85078125 7.609375  4.03046875 6.828125  C 3.21015625 6.046875  2.8 5.10416666666667  2.8 4  C 2.8 2.89583333333333  3.21015625 1.953125  4.03046875 1.171875  C 4.85078125 0.390625  5.840625 0  7 0  C 8.159375 0  9.14921875 0.390625  9.96953125 1.171875  Z " fill-rule="nonzero" fill="#aaaaaa" stroke="none" transform="matrix(1 0 0 1 27 33 )" />
              </g>
            </svg>登录</a>
          <a href="register.jsp"><svg version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="16px" height="16px" xmlns="http://www.w3.org/2000/svg">
            <g transform="matrix(1 0 0 1 -27 -33 )">
              <path d="M 14.1857730263158 14.1857730263158  C 14.1857730263158 14.7159539473684  13.8324177631579 15.0694736842105  13.3020559210526 15  L 1.81414473684211 15  C 1.28388157894737 15.0694736842105  0.930427631578948 14.7159539473684  1 14.1857565789474  L 1 2.69786184210526  C 0.930427631578948 2.16759868421053  1.28388157894737 1.81416118421053  1.81414473684211 1.81416118421053  L 8.88371710526316 1.81416118421053  L 8.88371710526316 0.930427631578947  L 1.81414473684211 0.930427631578947  C 0.842105263157895 0.930427631578947  0.046825657894737 1.72582236842105  0 2.69786184210526  L 0 14.1857730263158  C 0.046825657894737 15.1578947368421  0.842105263157895 15.9531743421053  1.81422697368421 16  L 13.3020559210526 16  C 14.2741940789474 15.9531743421053  15.0694736842105 15.1578947368421  15.0694736842105 14.1857730263158  L 15.0694736842105 7.11628289473684  L 14.1857565789474 7.11628289473684  L 14.1857565789474 14.1857565789474  Z M 13.6315789473684 5.46138157894737  L 10.5251315789474 2.37314144736842  L 3.70745065789474 9.18847039473684  L 3.08893092105263 12.8117105263158  L 6.80042763157895 12.2814309210526  L 13.6315789473684 5.46138157894737  Z M 15.4229934210526 1.19554276315789  L 14.8044407894737 0.576924342105263  C 14.4508388157895 0.223486842105263  14.0090789473684 0.0467434210526316  13.5672203947368 0.0467434210526316  C 13.1252796052632 0.0467434210526316  12.6835197368421 0.223486842105263  12.33 0.577006578947368  L 11.0602631578947 1.84674342105263  L 14.2048190789474 4.88815789473684  L 15.4230098684211 3.66996710526316  C 16.1299506578947 2.96300986842105  16.1299506578947 1.81412828947368  15.4230098684211 1.19552631578947  Z " fill-rule="nonzero" fill="#aaaaaa" stroke="none" transform="matrix(1 0 0 1 27 33 )" />
            </g>
          </svg>注册</a>
        </div>
        <div class="signedin">
          <p><img src="../img/notice.jpg" class="hidden-xs">
            欢迎<img src="../img/vip.jpg" width="27px" height="15px" id="vip"><a href="javascript:void(0);" id="cName">北京市京海换热设备制造有限责任公司</a></p>
          <div class="btns">
            <button type="button" id="vipbtn" class="btn btn-default  vipbtn">升级企业VIP</button>
            <button type="button" class="btn btn-default hidden-xs" onclick="qqzx()">在线咨询</button>
            <button type="button" class="btn btn-default" id="updatepass">修改密码</button>
            <button type="button" class="btn btn-default" id="out" >退出登陆</button>
          </div>
        </div>
      </div>

    </div>
  </div>
  <!--菜单-->
  <nav class="navbar navbar-default " role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse"
                data-target="#example-navbar-collapse">
          <span class="sr-only">切换导航</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

        <div class="clearfix pull-left">
          <a href="adminlogin.jsp" class="pull-right">
            <img src="../img/logo.png"  width="166px" height="59px">
          </a>
        </div>
      </div>
      <div class="collapse navbar-collapse" id="example-navbar-collapse">
        <ul class="nav navbar-nav">
          <li><a href="../index.jsp">首  页</a></li>
          <li><a href="purchase.jsp">国际采购</a></li>
          <li><a href="supply.jsp">国际供应</a></li>
          <li><a href="logistics.jsp">国际物流</a></li>
          <li><a href="news.jsp">新闻与资讯</a></li>
          <li><a href="about.jsp">关于我们</a></li>
        </ul>
      </div>
    </div>
  </nav>
</div>

</body>
</html>
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