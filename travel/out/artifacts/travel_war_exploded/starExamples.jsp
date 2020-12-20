<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta charset="UTF-8">
<title>我收藏的案例</title>

<link href="css/examples.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="content">
<s:iterator value="#session.employer.examples_star">
	<div class="picture">
		<a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
			<s:iterator value="pictures" status="st">
				<s:if test="%{#st.first==true}">
					<img src="<s:property value="picture1"/>" width="300px"/>
				</s:if>
			</s:iterator> <br> <s:property value="name" />
		</a>
	<div><a href="./unstarInList.action?exampleId=<s:property value='exampleId'/>"><button type="button">取消收藏</button></a></div></div>
</s:iterator>
</div>
</body>
</html>