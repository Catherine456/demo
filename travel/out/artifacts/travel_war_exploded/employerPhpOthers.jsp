<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>个人主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrapForPhp.css" rel='stylesheet' type='text/css' />
<link href="css/styleForPhp.css" rel='stylesheet' type='text/css' />
<link
	href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900'
	rel='stylesheet' type='text/css'>
<script src="js/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
	 function hideURLbar(){ window.scrollTo(0,1); } 


</script>
</head>

<body>
	<!-- Header Starts Here ---->
	<div class="header">
		<div class="container">
			<div class="header-profile">
				<img src="./images/profile.png" alt="" />
				<!-- 头像 -->
			</div>
		</div>
	</div>
	<div class="header-top">
		<h2>
			<s:property value="#request.employer.account" />
			<s:if test="%{#request.employer.sex}">
				<img src="images/boy.png" width="30" height="30" />
			</s:if>
			<s:else>
				<img src="images/girl.png" width="30" height="30" />
			</s:else>
		</h2>
	</div>
	<!-- Header Ends Here ---->
	<!--- About Me Starts Here --->
	<div class="about">
		<div class="container">
			<div class="about-top">
				<h3 class="top-title">TA的需求</h3>
				<span class="line"></span>
				<div>
				<s:iterator value="#request.employer.needs">
						<div display="inline-block">
							<a href="./needsByID?needsId=${needsId}">
							<s:property value="title" />
							</a>
						</div>
				</s:iterator>
				</div>
			</div>
		</div>
	</div>
	<!--- About Me Ends Here --->
	<!--- Contact Starts Here ---->
	<div class="contact">
		<div class="container">
			<div class="contact-top">
				<h3 class="top-title">Contact He/She</h3>
				<span class="line"></span>
				<p>
					<s:property value="#request.employer.introduction" />
				</p>
				<div class="row contact-row">
					<div class="col-md-4 contact-column">
						<i class="loc"></i>
						<p>
							<s:property value="#request.employer.region" />
						</p>
					</div>
					<div class="col-md-4 contact-column">
						<i class="mail"></i>
						<p>
							<a href="mailto:example@gmail.com"><s:property
									value="#request.employer.email" /></a> <br> wechat:
							<s:property value="#request.employer.wechat" />
							<br> qq:
							<s:property value="#request.employer.qq" />
						</p>
					</div>
					<div class="col-md-4 contact-column">
						<i class="phone"></i>
						<p>
							<s:property value="#employer.employer.phone" />
						</p>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
	</div>
	<!--- Contact Ends Here ---->
	<!--- Footer Starts Here ---->
	<div class="footer">
		<div class="container">
			<p class="copyright">
				2014 Template By <a href="http://w3layouts.com">W3layouts</a>
			</p>
		</div>
	</div>
	<!--- Footer Ends Here ---->
</body>
</html>



