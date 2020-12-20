<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>评价空间</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrapForPhp.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
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
				<img src="/designer/designer/profilephoto/<s:property value="#request.orderr.designer.profilePhoto"/>" alt="" width="100" height="100"/>
				<!-- 头像 -->
			</div>
		</div>
	</div>
	<div class="header-top"></div>

	<!--- About Me Ends Here --->
	<!--- Contact Starts Here ---->
	<div class="contact">
		<div class="container">
			<div class="container">
				<h2 class="w3ls_head">
					<span>welcome to</span>the review
				</h2>
				<p class="w3agile">不要吝啬提出建议，毫无保留的抒发出来吧！</p>
			</div>
			<div class="contact-top">
				<s:form action="apprise" method="post">
					<div class="contact-form">
						<s:hidden name="employerId"  value="%{#session.employer.employerId}" />
						<s:hidden name="designerId"  value="%{#request.orderr.designer.designerId}" />
						<div class="text">
							<textarea value="content" name="apprise.content"
								onfocus="this.value = '';" />
							您的评价(不少于20字)
							</textarea>
						</div>
						<div class="text">
							<input type="text" value="您的评分(1-10)" name="apprise.score"
								onfocus="this.value = '';" />
						</div>
						<div class="text">
							<input type="submit" value="提交" />
						</div>
				</s:form>
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