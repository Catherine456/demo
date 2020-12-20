<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="keywords" content="室内装修设计交易平台"/>
    <meta name="description" content=""/>
    <link href="css/global2.css" rel="stylesheet" type="text/css"/>
    <link href="css/float_tool.css" rel="stylesheet" type="text/css"/>
    <link href="css/common.css" rel="stylesheet" type="text/css"/>
    <link href="css/userCenter.css" rel="stylesheet" type="text/css"/>

    <link href="css/needlist_style.css" rel="stylesheet" type="text/css" media="all"/>


    <link type="text/css" rel="stylesheet" href="css/common.css"/>
    <link href="css/bootstrap3.css" rel="stylesheet">
    <link href="css/bootstrap-responsive3.css" rel="stylesheet">

    <!-- Extra Styles, not needed for Mega Menu or Boostrap -->
    <link href="css/style3.css" rel="stylesheet">

    <!-- Mega Menu Style, you kinda really need Bootstrap in order for this to work -->
    <link href="css/mega-menu3.css" rel="stylesheet">

    <script type="text/javascript" src="https://stc.shejiben.com/gb_js/sea.js"></script>
    <script type="text/javascript">
        seajs.config({
            alias: {
                'jquery': 'js/jquery_module.js',  //jquery version must be 1.7x
                'common': 'js/main.js',
                'form': 'js/module.form.js',
                'ui': 'js/module.ui.js',
                'colorbox': 'js/jquery.colorbox.min.js',
                'newHeader': 'js/userCenter.js'
            },
            preload: ['jquery', 'common']  //预加载jquery和main.js
        });
    </script>

    <script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/distpicker.data.js"></script>
    <script src="js/distpicker.js"></script>
    <script src="js/main.js"></script>
    <script>
        $(document).ready(function () {
            $('#ecityName').change(function () {
                var provinceId = $("#distpicker").find('option:selected').eq(0).attr('data-code');
                var provinceName = $("#eprovinceName").val();
                var cityId = $("#distpicker").find('option:selected').eq(1).attr('data-code');
                var cityName = $("#ecityName").val();
                var city = cityName;
                var myform = $('#form1'); //得到form对象
                document.getElementById("city").value = city;
                myform.submit();
//window.location.href="./findneeds?area=${area}&city=${city}&money=${money}&order=${order}&city="+encodeURI(encodeURI(city));//页面跳转并传参  
            })
        })
    </script>
    <script>
        $(function () {
            $("#distpicker").distpicker('destroy');
            $("#distpicker").distpicker({
                autoSelect: false,
                placeholder: false,
                province: '----请选择省----',
                city: '----请选择市----',
            });
        });
    </script>
    <title>需求列表</title>
</head>
<body>


<header class="container">

    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="navbar-inner" style="height: 60px;">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>

                <div class="nav-collapse collapse">
                    <ul class="nav">

                        <li><a href="index.jsp">首页</a></li>
                        <li><a href="findAllExample">看案例</a></li>
                        <li><a href="findneeds">找需求</a></li>

                        <s:if test="%{#session.id==null}">
                            <li><a href="login.jsp">登录</a></li>
                            <li><a href="contact.html">注册</a></li>
                        </s:if>
                        <s:else>
                        <li><a href="judge.action" target="_Blank">个人主页</a>
                        <li>
                            </s:else>
                    </ul>
                </div><!--/.nav-collapse -->
            </div><!-- Container -->
        </div><!-- Nav Bar - Inner -->
    </div><!-- Nav Bar -->

</header><!-- /container -->


<div class="dmato"></div>
<div class="content_width" id="content">
    <div class="content_width ">
        <script type="text/javascript">
            seajs.use(['newHeader', 'common'], function (Header, common) {
                $(document).ready(function () {
                    Header.init();
                    common.initHeader();
                });
            });
        </script>


        <div class="content order_lobby">
            <div class="selec_ele">
                <form action="./findneeds" id="form1">
                    <div class="sele selec_area">
                        <label>项目面积：</label>
                        <div>
                            <s:if test="#request.area==0">
                                <a href="./findneeds?area=0&money=${money}&order=${order}&city=${city}" class="cur"
                                   style="margin-left: 15px;">不限</a>
                            </s:if>
                            <s:else>
                                <a href="./findneeds?area=0&money=${money}&order=${order}&city=${city}" class=""
                                   style="margin-left: 15px;">不限</a>
                            </s:else>
                            <s:iterator value="#session.areaList" var="a" status="st">
                                <s:if test="#st.index>0">
                                    <s:if test="#request.area==#st.index">
                                        <a href="./findneeds?area=${st.index}&money=${money}&order=${order}" class="cur"
                                           style="margin-left: 15px;">${a }平米</a>
                                    </s:if>
                                    <s:else>
                                        <a href="./findneeds?area=${st.index}&money=${money}&order=${order}" class=""
                                           style="margin-left: 15px;">${a }平米</a>
                                    </s:else>
                                </s:if>
                            </s:iterator>
                        </div>
                    </div>


                    <div class="sele selec_budget">
                        <label>设计预算：</label>
                        <div>
                            <s:if test="#request.money==0">
                                <a href="./findneeds?money=0&area=${area}&order=${order}" class="cur"
                                   style="margin-left: 15px;">不限</a>
                            </s:if>
                            <s:else>
                                <a href="./findneeds?money=0&area=${area}&order=${order}" class=""
                                   style="margin-left: 15px;">不限</a>
                            </s:else>
                            <s:iterator value="#session.moneyList" var="a" status="st">
                                <s:if test="#st.index>0">
                                    <s:if test="#request.money==#st.index">
                                        <a href="./findneeds?money=${st.index}&area=${area}&order=${order}" class="cur"
                                           style="margin-left: 15px;">${a }元</a>
                                    </s:if>
                                    <s:else>
                                        <a href="./findneeds?money=${st.index}&area=${area}&order=${order}" class=""
                                           style="margin-left: 15px;">${a }元</a>
                                    </s:else>
                                </s:if>
                            </s:iterator>
                        </div>
                    </div>


                    <div class="sele selec_city">
                        <label>所在城市：</label>
                        <div>
                            <div data-toggle="distpicker" id="distpicker1">
                                <select id="eprovinceName" name="provinceName"></select>
                                <select id="ecityName" name="cityName"></select>
                                当前选择：${city }
                                <input type="hidden" value="${area }" name="area" id="area">
                                <input type="hidden" value="${money }" name="money" id="money">
                                <input type="hidden" value="${order }" name="order" id="order">
                                <input type="hidden" name="city" id="city" value="${city }"/>
                            </div>

                        </div>
                    </div>
                </form>
            </div>

            <div class="selec_sort">
                <div class="selec_s_">
                    <s:if test="#request.order==1">
                        <a href="./findneeds?order=1&money=${money}&area=${area}" class="cur">发布时间<span></span></a>
                    </s:if>
                    <s:else>
                        <a href="./findneeds?order=1&money=${money}&area=${area}" class="">发布时间<span></span></a>
                    </s:else>
                    <s:if test="#request.order==2">
                        <a href="./findneeds?order=2&money=${money}&area=${area}" class="cur">总面积<span></span></a>
                    </s:if>
                    <s:else>
                        <a href="./findneeds?order=2&money=${money}&area=${area}" class="">总面积<span></span></a>
                    </s:else>
                </div>
            </div>

            <div class="prod_list">
                <div class="list_" style="width: 1000px;">
                    <s:iterator value="needs1" var="needs">
                        <div class="list_info" style="width: 260px;display: inline-block;">
                            <div class="_info" style="width: 200px;display: inline-block;">
                                <div><a href="./needsByID?needsId=${needs.needsId}" target="_blank"><s:property
                                        value="#needs.title"/></a>
                                    <span class="price"><s:property value="#needs.money"/></span></div>
                                <a href="./needsByID?needsId=${needs.needsId}"
                                   style="margin-left: 800px;font-size:14px">查看详情</a>
                                <div class="jc_info">
                                    <span style="padding-left:0;"><s:property value="#needs.city"/></span>
                                    <span><s:property value="#needs.area"/>m²</span>
                                    <span>${needs.style }</span>
                                    <span style="border-right:none;"><s:date name="%{#needs.time1}"
                                                                             format="yyyy-MM-dd HH:mm:ss"/></span>
                                </div>
                            </div>
                            <div class="btne apply_index"></div>
                        </div>
                    </s:iterator>
                    <div class="page">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>