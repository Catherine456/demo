<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>全景图展示</title>
<script type="text/javascript" src="aframe-v0.8.2.js"></script>
</head>
<body>
	 <a-scene> 
	<a-sky src="<s:property value='#request.path'/>" rotation="0 -130 0"></a-sky> 
	</a-scene>
</body>
</html>