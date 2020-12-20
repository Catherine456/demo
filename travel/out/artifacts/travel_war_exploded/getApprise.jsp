<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
    <title>我收到的评价</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/DIndexstyle.css">
</head>
<body class="body">



<!-- 表格 -->
<table class="layui-table">
    <thread>
        <tr><td>评价内容</td><td>评分</td><td>用户ID</td></tr>
    </thread>
    <s:if test="%{#request.list!=null}">
        <s:iterator value="#request.list">
            <tr>
                <td><s:property value="content"/></td>
                <td><s:property value="score"/></td>
                <td><s:property value="employer.employerId"/></td>
            </tr>
        </s:iterator>
    </s:if>

</table>
</body>
</html>	