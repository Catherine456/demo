<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>个人主页</title>

<link href="css/bootstrapForPhp.css" rel='stylesheet' type='text/css' />
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
<script type="text/javascript">
	var msg = "" + '${request.tipMessage}';
	if (msg != "") {
		alert(msg);
	}
</script>
</head>

<body>
	<!-- Header Starts Here ---->
	<div class="header">
		<div class="container">
			<div class="header-profile">
				<img src="designer/designer/profilephoto/<s:property value="#request.designer.profilePhoto"/>" alt="" width="150" height="100"/>
				<!-- 头像 -->
			</div>
		</div>
	</div>
	<div class="header-top">
		<h2>
			<s:property value="#request.designer.account" />
			<s:if test="%{#request.designer.sex==0}">
				<img src="images/boy.png" width="30" height="30" />
			</s:if>
			<s:else>
				<img src="images/girl.png" width="30" height="30" />
			</s:else>
		</h2>
		<small>粉丝数：<s:property value="#request.designer.fans" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<img src="images/praise.jpg" width="15" height="15" /> <s:property
				value="#request.designer.praise" /></small>
	</div>
	<!-- Header Ends Here ---->
	<!--- About Me Starts Here --->
	<div class="about">
		<div class="container">
			<div class="about-top">
				<h3 class="top-title">TA的案例</h3>
				<span class="line"></span>
				<div class="images">
					<s:iterator value="#request.designer.examples_own">
						<div display="inline-block">
							<a
								href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
								<s:iterator value="pictures" status="st">
									<s:if test="%{#st.first==true}">
										<img src="<s:property value="picture1"/>" width="100"
											height="200" />
									</s:if>
									<s:else>
										
									</s:else>
								</s:iterator> <br> <s:property value="name" />
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
				<h3 class="top-title">Contact TA</h3>
				<span class="line"></span>
				<p>
					<s:property value="#request.designer.introduction" />
				</p>
				<div class="row contact-row">
					<div class="col-md-4 contact-column">
						<i class="loc"></i>
						<p>
							<s:property value="#request.designer.region" />
						</p>
					</div>
					<div class="col-md-4 contact-column">
						<i class="mail"></i>
						<p>
							<a href="mailto:example@gmail.com"><s:property
									value="#request.designer.email" /></a> <br> wechat:
							<s:property value="#request.designer.wechat" />
							<br> qq:
							<s:property value="#request.designer.qq" />
						</p>
					</div>
					<div class="col-md-4 contact-column">
						<i class="phone"></i>
						<p>
							<s:property value="#request.designer.phone" />
						</p>
					</div>
					<div class="clearfix"></div>
				</div>
				<!-- 
				<s:form action="subscribe" method="post">
					<div class="contact-form">
						<div class="text">
							<input type="text" value="需求标题" name="subscribe.title"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Your Name..';}" />
						</div>
						<div class="text">
							<input type="text" value="预算金额" name="subscribe.money"
								onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Your Email..';}" />
						</div>
						<div class="text">
							<textarea value="信息" onfocus="this.value = '';"
								name="subscribe.description"
								onblur="if (this.value == '') {this.value = 'Message';}">需求描述</textarea>
						</div>
						
				</s:form>
				 -->
				 
				 <div class="text">
					<a href="gotoSubscribe?designerID=<s:property value="#request.designer.designerId" />"><input type="button" value="预约" /></a>
				</div>
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



