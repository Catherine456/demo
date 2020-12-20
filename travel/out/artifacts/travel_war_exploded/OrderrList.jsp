 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%> 
<html> 
<head>
	<title>我的历史订单</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/DIndexstyle.css">
</head>
<body class="body">

<!-- 工具集 -->
<div class="my-btn-box">
    <span class="fr">
        <div class="layui-input-inline">
            <input type="text" id="search" name="search" autocomplete="off" placeholder="请输入订单名称" class="layui-input">
        </div>
        <button class="layui-btn mgl-20">查询</button>
    </span>
</div>

<!-- 表格 -->
<table class="layui-table">

<thread>
<tr><td>订单名称</td><td>订单预算</td><td>订单创建时间</td><td>订单状态</td><td>操作</td></tr>
</thread>
<s:if test="%{#session.designer!=null}">

<s:iterator value="#session.designer.orderrs">
 <tr>
 <td><s:property value="title"/></td>
 <td><s:property value="money"/></td>
 <td><s:date name="beginTime" format="yyyy-MM-dd HH:mm:ss"/></td>
 <td><s:property value="state"/></td>
 <td><a href="orderrByID.action?orderrId=<s:property value='orderrId' />"  target="_blank" class="layui-btn layui-btn-mini layui-btn-normal">查看详情</a></td>
 </tr>
 </s:iterator>
    <a href="getApprise.action?designerId=<s:property value='#session.designer.designerId'/> "  target="_blank" class="layui-btn layui-btn-mini layui-btn-normal">查看我收到的评论</a>

 </s:if>
 <s:elseif test="%{#session.employer!=null}">
 <s:iterator value="#session.employer.orderrs">
 <tr>
 <td><s:property value="title"/></td>
 <td><s:property value="money"/></td>
 <td><s:date name="beginTime" format="yyyy-MM-dd HH:mm:ss"/></td>
 <td><s:property value="state"/></td>
 <td><a href="orderrByID.action?orderrId=<s:property value='orderrId' />"   target="_blank"  class="layui-btn layui-btn-mini layui-btn-normal">查看详情</a>
 <s:if test="%{state.equals('已完成')}">
 <a href="app.action?orderrId=<s:property value='orderrId' />"  target="_blank" class="layui-btn layui-btn-mini layui-btn-normal">评论</a></td>
 </s:if>
 </tr>
 </s:iterator>
 </s:elseif>
</table>
</body>
</html>	