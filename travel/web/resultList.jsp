<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<s:head theme="xhtml"/>
<sx:head parseContent="true" extraLocales="UTF-8"/>
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/lsb.css">


<link rel="stylesheet" type="text/css" href="style/list.css"/>

<link rel="stylesheet" href="css/font-awesome.min.css" />
</head>
<body>
		<s:if test="#request.examples.size()!=0">
		<s:iterator value="#request.examples" >
			<div class="resultitem">
				<a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
				<s:iterator value="pictures" status="st" >
					<s:if test="%{#st.first==true}">
						<img src="<s:property value="picture1"/>"/>
					</s:if>
					<s:else>
					<img style="display:none; border:0px;" src="<s:property value="picture1"/>"/>
					</s:else>
				</s:iterator> 
				<div class="description">
					<h4><s:property value="name"/></h4>
				</div>
				</a>
			</div>
		</s:iterator>
		</s:if>
		<s:else>
		<h1>没有找到哦</h1>
		</s:else>
</body>
</html>