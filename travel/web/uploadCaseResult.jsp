<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>上传结果</title>
<style>
.content
{
	text-align:center;
	margin-top: 100px;
}

.content a
{
	display:block;
}


</style>
<link type="text/css" rel="stylesheet" href="css/common.css" />
 <link href="css/bootstrap3.css" rel="stylesheet">
    <link href="css/bootstrap-responsive3.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Extra Styles, not needed for Mega Menu or Boostrap -->
	<link href="css/style3.css" rel="stylesheet">
	<link rel="stylesheet" href="layui/css/layui.css">
	<!-- Mega Menu Style, you kinda really need Bootstrap in order for this to work -->
	<link href="css/mega-menu3.css" rel="stylesheet">
</head>
<body>
	<header class="container">


	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>

				<div class="nav-collapse collapse">
					<ul class="nav">
						<li><a href="index.jsp">首页</a></li>
						<li><a href="findAllExample">看案例</a></li>
						<li><a href="findneeds">找需求</a></li>
						<li><a href="judge.action" target="_Blank">我的主页</a></li>
						<li><a href="designerIndex.jsp">个人中心</a></li>



					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
			<!-- Container -->
		</div>
		<!-- Nav Bar - Inner -->
	</div>
	<!-- Nav Bar -->


	<div class="content">

		<img src="images/uploadCaseSuccess.png">
		<s:a hrer="uploadCase.jsp">返回</s:a>
	</div>
</body>
</html>