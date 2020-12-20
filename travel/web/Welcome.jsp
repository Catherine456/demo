<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <title>Welcome</title>
    <link rel="stylesheet" href="layui/css/layui.css">
    <link rel="stylesheet" href="css/DIndexstyle.css">
</head>
<body class="body">

<div title="欢迎使用" style="padding:20px;overflow:hidden; color:black; text-align:center;" >
   <br/>
  	<br/>
  	<br/>
	<p style="font-size: 50px; line-height: 60px; height: 60px;">室内平面设计交易平台</p>
	<p style="font-size: 25px; line-height: 30px; height: 30px;">
	 <s:if test="%{#session.designer!=null}">
	<s:property value="#session.designer.name" />
	</s:if>
	<s:elseif test="%{#session.employer!=null}">
	<s:property value="#session.employer.name" />
	</s:elseif>
	欢迎使用!</p>
  	<hr />
  	<br/>
  	<br/>
  	<br/>
</div>
</body>
</html>