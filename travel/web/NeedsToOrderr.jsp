 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%> 
<html> 
<title>创建订单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<sx:head parseContent="true" extraLocales="UTF-8"/> 

<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<link rel="stylesheet" href="layui/css/layui.css">
<link rel="stylesheet" href="css/DIndexstyle.css">
<script type="text/javascript"> 
 </script>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
    <legend>创建订单</legend>
</fieldset>

<form class="layui-form" action="SubmitOrderr" method="post">
    <input type="hidden" name="designer.designerId"  value="<s:property value="#request.designer.designerId" />" />
    <input type="hidden" name="employer.employerId"  value="<s:property value="#session.employer.employerId" />" />
    
    <div class="layui-form-item">
        <label class="layui-form-label">设计师</label>
        <div class="layui-input-block" >
        <a href="putDesigner.action?designer.designerId=<s:property value='designerId' />"  target="_blank"> <s:property value="#request.designer.name"/></a>
        </div>
    </div>
     <div class="layui-form-item">
        <label class="layui-form-label">订单标题</label>
        <div class="layui-input-block">
            <input type="text" name="orderr.title" value="<s:property value="#request.needs.title"/>"   lay-verify="required|title"  maxlength="100"  placeholder="请输入标题"  autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">订单描述</label>
        <div class="layui-input-block">
            <textarea name="orderr.description" placeholder="请输入订单描述" lay-verify="required|desc" maxlength="500" class="layui-textarea"><s:property value="#request.needs.description"/></textarea>
        </div>
    </div>
    <div class="layui-form-item">
         <label class="layui-form-label"></label>
         <div class="layui-input-block content">
         <p style="line-height: 30px; color: red;">若设计师提供方案，您不满意，双方因此而产生退款的话，设计师不提供设计源文件！</p>
         </div>
     </div>
     <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">设计完期</label>
             <div class="layui-input-inline">
                <input type="text" name="orderr.designTime" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux"><i class="red" style="color: red;">*</i>注：和设计师约定完成时间</div>
      </div>
     </div>
      <div class="layui-form-item">
        <label class="layui-form-label">总金额</label>
        <div class="layui-input-inline">
            <input type="text" name="orderr.money" value="<s:property value="#request.needs.money"/>"  lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
         <div class="layui-form-mid layui-word-aux"><i class="red" style="color: red;">*</i>注：和设计师谈好酬金</div>
    </div>
    
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">提交订单</button>
        </div>
    </div>
</form>

<script src="layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
                ,layer = layui.layer
                ,layedit = layui.layedit
                ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });        
   
    });
</script>
</body>
</html>