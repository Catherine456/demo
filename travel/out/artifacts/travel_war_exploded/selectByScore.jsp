<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Upholstery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<title>挑选设计师</title>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- font-awesome-icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome-icons -->
<link
	href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">

</head>
<body style="background-color: #c7d7e4">
	<!-- contact -->
	<div class="contact" style="background-color: #f5f5f5">
		<div class="container" style="background-color: #c2c4c730">
			<h2 class="w3ls_head">
				<span>select</span>Designer
			</h2>
			
				<div class="searchByAccount">
					<form action="searchByAccount" method="post">
					<center>
						<table>
							<tr>
								<th><label>查找设计师：</label></th>
								<th><a href="./findAll" class="cur"
									style="margin-left: 15px;">全部</a></th>
								<!--  <th><s:textfield name="id" value="%{#request.designerId}"
										style="margin-left: 15px;color: #bf0909;border-bottom: 1px solid #a94442" /> </th>-->
										<th> <input class="searchtext" type="text" name="account" required="" style="margin-left: 15px;color: #bf0909;border-bottom: 1px solid #a94442"></th>
								<th><s:submit value="搜索" style="margin-left: 30px"/></th>
							
						    </tr>
						</table>
			</center>
			</form>
		</div>
		<p class="w3agile">Choose your favorite designer to design your
			most comfortable room.</p>
		<p class="w3agile">预算:可议价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;需求类型:房屋设计&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报名截止时间:2018/12/31</p>
		<br>
		<center>
			<tr>
				<td><a href="./findAll">默认排序</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
				<td><a href="./findByPraise">赞数</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
				<td><a href="./findByScore">评分</a></td>&nbsp;&nbsp;&nbsp;&nbsp;
			<tr>
		</center>
		<br>
		<div class="designer">
			<s:iterator value="#request.designers">
				<div class="col-sm-4 designer-grids" style="display: inline-block">
					<span>
						<table>
							<tr>
								<th style="width: 100px">
									<div style="display: inline-block; float: left;">
										<img src="designer/designer/profilephoto/<s:property value="profilePhoto"/>" alt=" " class="img-responsive" />
									</div>
								</th>
								<th style="width: 150px">
									<div style="display: inline-block; float: right;">

										<h5>
											<li>用户名: <s:property value="account" />
											</li>
										</h5>
										<h5>
											<li>手机:<s:property value="phone" />
											</li>
										</h5>
										<h5>
											<li>所在地： <s:property value="region" />
											</li>
										</h5>
										<h5>
											<li>赞数： <s:property value="praise" />
											</li>
										</h5>
										<h5>
											<li>评分： <s:property value="score" />
											</li>
										</h5>
										<li><a
											href="putDesigner.action?designer.designerId=<s:property value='designerId' />">联系他</a>
										</li>
									</div>
								</th>
							</tr>
							<br>
						</table>
					</span>
				</div>
			</s:iterator>
		</div>
	</div>
	</div>

</body>
</html>