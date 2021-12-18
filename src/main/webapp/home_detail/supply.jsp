<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 12/12/2021
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <!-- <base href="http://114.55.145.59:80/rctms/"> -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>国际供应</title>
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/base.css">
    <script src="../js/jquery-1.10.2.js"></script>
    <script src="../js/bootstrap.js"></script>
    <script src="../js/base.js"></script>
</head>
<body>


<%@include file="header.jsp"%>
<!-- 国际采购菜单-->
<div class="containerbox">
    <div class="container navmenu">
        <div class="jumbotron">
            <img src="../img/pic3.jpg" class="img-responsive"/>
        </div>
    </div>
    <div class="menu"> 当前位置：<a href="index.jsp">首页</a> >> <a href="supply.jsp">国际供应</a> <span id="businessName"></span></div>
</div>
<!--国际采购订单-->
<div class="container" >
    <div class="row">
        <div  class="col-md-9" id="purchase">
            <div class="row purchase-title" >
                <div class="col-md-12 ">
                    <h2 class="div-title"> 国际供应 <span>IMPORT SUPPLY</span></h2>
                </div>
            </div>
            <div class="order" id="orderlist">
                <!--
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-4" >
                            <img src="img/info.jpg"  class="img-responsive">
                        </div>
                        <div class="col-sm-8">
                            <h4><a href="http://114.55.145.59:80/rctms/home_detail/supply_details.jsp">国际供应订单中文名称</a></h4>
                            <span>English name of imported goods</span>
                            <p>中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液、车用尿素、汽车养护品等产品。中外合资企业，所生产的A9 系列高级润滑油涵盖汽车润滑油、工业用油、润滑脂、防冻液。</p>
                            <div class="deail">
                                <p class="date">2021-01-05</p>
                                <p class="state1">订单状态：进行中</p>
                                <p><object data="img/ched.svg" width="19" height="16"  ></object>
                                    轻工业类</p>
                            </div>

                        </div>
                    </div>
                    <div class="pagelist">
                        <ul class="nav  nav-pills">
                            <li><a href="#"> < </a></li>
                            <li class="active"><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#"> > </a></li>
                        </ul>
                    </div>
                     -->
            </div> <!-- id="orderlist" -->

        </div>  <!-- id="purchase" -->
        <div class="col-md-3 aside" >

            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>行业分类</title>
                <script type="text/javascript">
                    $(function(){
                        //行业类别
                        $.ajax({
                            url:"home/queryBusiness",
                            type:"get",
                            dataType:"json",
                            success:function(result){
                                if(result.message=="success"){
                                    var str="";
                                    $.each(result.obj,function(key,business){
                                        str+="<li><a href='home_detail/supply.jsp?businessid="+business.id+"&businessName="+business.businessName+"'>"+business.businessName+"</a></li>";
                                    });
                                    $("#nav").append(str);
                                }
                            }
                        });

                        //国际采购订单
                        $.ajax({
                            url:"home/queryOrderByCondition",
                            type:"get",
                            data:{
                                count:2,
                                flag:1
                            },
                            dataType:"json",
                            success:function(result){
                                if(result.message=="success"){
                                    $.each(result.obj,function(key,order){
                                        var str="<div class='col-md-12 col-sm-6 col-xs-6'>";
                                        str+="<div>";
                                        str+="<img src='homeImages/"+order.img1+"'  class='img-responsive'>";
                                        str+="<h4 onclick=\"window.location.href='home_detail/purchase_details.jsp?orderid=" +order.orderid +"'\">"+order.orderNamech+"</h4>";
                                        str+="<p>"+order.orderNameen+"</p>";
                                        str+="<button>国际采购订单</button>";
                                        str+=" </div>";
                                        str+=" </div>";
                                        $("#gjcgdd").append(str);
                                    });
                                }
                            }
                        });

                        //国际供应订单
                        $.ajax({
                            url:"home/queryOrderByCondition",
                            type:"get",
                            data:{
                                count:2,
                                flag:2
                            },
                            dataType:"json",
                            success:function(result){
                                if(result.message=="success"){
                                    $.each(result.obj,function(key,order){
                                        var str="<div class='col-md-12 col-sm-6 col-xs-6'>";
                                        str+="<div>";
                                        str+="<img src='homeImages/"+order.img1+"'  class='img-responsive'>";
                                        str+="<h4 onclick=\"window.location.href='home_detail/supply_details.jsp?orderid=" +order.orderid +"'\">"+order.orderNamech+"</h4>";
                                        str+="<p>"+order.orderNameen+"</p>";
                                        str+="<button>国际供应订单</button>";
                                        str+=" </div>";
                                        str+=" </div>";
                                        $("#gjgydd").append(str);
                                    });
                                }
                            }
                        });
                    });
                </script>
            </head>
            <body>
            <div class="industry">
                <h2 class="aside-title"> <img src="../img/font2.png" /></h2>
                <ul class="nav" id="nav">
                    <!--
                        <li><a href="#">轻工业类</a></li>
                        <li><a href="#">重工业类</a></li>
                        <li><a href="#">农业类</a></li>
                        <li><a href="#">纺织类</a></li>
                        <li><a href="#">日用百货类</a></li>
                        <li><a href="#">食品类</a></li>
                        <li><a href="#">运动休闲类</a></li>
                        <li><a href="#">3C产品</a></li>
                    -->
                </ul>
            </div>
            <div>
                <h2 class="aside-title"> <img src="../img/font3.png" /></h2>
                <div class="row good1 good" id="gjcgdd">
                    <!--
                    <div class="col-md-12 col-sm-6 col-xs-6">
                        <div>
                            <img src="img/info.jpg"  class="img-responsive">
                            <h4>阿里巴巴生活模式</h4>
                            <p>Alibaba Life Mode  </p>
                            <button>国际采购订单</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-6 col-xs-6">
                        <div>
                            <img src="img/info.jpg"  class="img-responsive">
                            <h4>阿里巴巴生活模式</h4>
                            <p>Alibaba Life Mode  </p>
                            <button>国际采购订单</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-6 col-xs-6">
                        <div>
                            <img src="img/info.jpg"  class="img-responsive">
                            <h4>阿里巴巴生活模式</h4>
                            <p>Alibaba Life Mode  </p>
                            <button>国际采购订单</button>
                        </div>
                    </div >
                    -->
                </div>
                <div class="row good2 good" id="gjgydd">
                    <!--
                    <div class="col-md-12 col-sm-6 col-xs-6">
                        <div>
                            <img src="img/info.jpg"  class="img-responsive">
                            <h4>阿里巴巴生活模式</h4>
                            <p>Alibaba Life Mode  </p>
                            <button>国际供应订单</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-6 col-xs-6">
                        <div>
                            <img src="img/info.jpg"  class="img-responsive">
                            <h4>阿里巴巴生活模式</h4>
                            <p>Alibaba Life Mode  </p>
                            <button>国际供应订单</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-6 col-xs-6">
                        <div>
                            <img src="img/info.jpg"  class="img-responsive">
                            <h4>阿里巴巴生活模式</h4>
                            <p>Alibaba Life Mode  </p>
                            <button>国际供应订单</button>
                        </div>
                    </div >
                    -->
                </div>
            </div>
            </body>
            </html>
        </div>
    </div>
</div>
<!--底部-->


<%@include file="footer.jsp"%>
</body>
</html>

