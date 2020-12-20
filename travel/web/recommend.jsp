<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>设计师认证</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/global.css" media="all">
    <link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
</head>
<body>

<section class="layui-larry-box">
    <div class="larry-personal">
        <header class="larry-personal-tit">
            <span>申请推优</span><span style="color:red">${request.tip }</span>
        </header><!-- /header -->
        <s:if test="%{#session.designer.status1==null}">
            <div class="larry-personal-body clearfix">
                <div class="layui-form-item">您可以选择推优一个案例，或者是个人设计师推优</div>
            </div>
            <div class="larry-personal-body clearfix">
                <form class="layui-form col-lg-5" action="recommend1" method="post" enctype="multipart/form-data">
                    <!--<div class="layui-form-item">
                         <label class="layui-form-label">推优中介费</label>
                         <div class="layui-input-block">
                             <input type="text" name="designer.money1"  autocomplete="off" class="layui-input">
                         </div>
                     </div>-->
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1">点击此报名申请个人推优</button>
                        </div>
                    </div>
                </form>
                <form class="layui-form col-lg-5" action="recommend2" method="post" enctype="multipart/form-data">
                    <!--  <div class="layui-form-item">
                        <label class="layui-form-label">推优中介费</label>
                        <div class="layui-input-block">
                            <input type="text" name="designer.money1"  autocomplete="off" class="layui-input">
                        </div>
                    </div>-->
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit="" lay-filter="demo1">申请案例推优</button>
                        </div>
                    </div>
                </form>
            </div>

            <div class="larry-personal-body clearfix">
                <form class="layui-form col-lg-5">
                    <div class="layui-form-item">
                        <div class="layui-input-block"></div>
                    </div>
                </form>
                <form class="layui-form col-lg-5">
                    <div class="layui-form-item">
                        <div class="layui-input-block"></div>
                    </div>
                    <s:iterator value="#session.designer.examples_own">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <s:property value="name"/>-->
                                <a href="recommend3.action?message=<s:property value='name'/>">点击此报名申请推优该案例
                            </div>
                        </div>
                    </s:iterator>
                </form>
            </div>
        </s:if>

        <s:elseif test="%{#session.designer.status1==2||#session.designer.status1==4}">
        <div class="layui-input-block">
            您已成功推优！
        </div>
    </div>
    </s:elseif>
    <s:else>
        <div class="layui-form-item">
            <div class="layui-input-block">
                您已申请推优，请耐心等待
            </div>
        </div>
    </s:else>

</section>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript">
    layui.use(['form', 'upload'], function () {
        var form = layui.form();
        layui.upload({
            url: '',//上传接口
            success: function (res) {
                //上传成功后的回调
                console.log(res)
            }
        });

    });
</script>
</body>
</html>