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
            <input type="text" id="search" name="search" autocomplete="off" placeholder="请输入需求名称" class="layui-input">
        </div>
        <button class="layui-btn mgl-20">查询</button>
    </span>
</div>

<!-- 表格 -->
<table class="layui-table">
<thread>
<tr><td>需求名称</td><td>预算</td><td>风格</td><td>规格</td><td>报名人数</td><td>操作</td></tr>
</thread>
 <s:iterator value="#session.employer.needs">
 <tr>
 <td><s:property value="title"/></td>
 <td><s:property value="money"/></td>
 <td><s:property value="style"/></td>
  <td><s:property value="area"/>m<sup>2</sup></td>
   <td><s:property value="enrollment"/></td>
 <td><a href="needsByID?needsId=<s:property value='needsId' />"  target="_top"  class="layui-btn layui-btn-mini layui-btn-normal">查看详情</a></td>
 </tr>
 </s:iterator>
</table>
</body>
</html>	