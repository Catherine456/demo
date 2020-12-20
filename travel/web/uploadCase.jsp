<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>上传案例</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Upholstery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/upload_style.css" rel="stylesheet" type="text/css" media="all" />

<link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" property="" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/uploadcase.js"></script>
<script type="text/javascript" src="js/uploadcase2.js"></script>

<!-- //js -->
<!-- font-awesome-icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome-icons -->
	<link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese" rel="stylesheet">
<script type="text/javascript">
	//校验
	function check() {
		var fileType = $("#UploadCase_upload").val();
		var fileType2 = $("#UploadCase_upload2").val();

		if (fileType == null || fileType == "")
		{
			alert("请至少上传一张全景图！");
			return false;
		}
		if (fileType2 == null || fileType2 == "")
		{
			alert("请至少上传一张平面图！");
			return false;
		}
		//判断后缀是不是需要的文件类型
		if ((fileType2 != null && fileType2 != "")&& (fileType != null && fileType != "")) {
			var start2 = fileType2.lastIndexOf(".") + 1;
			var start = fileType.lastIndexOf(".") + 1;
			var length2 = fileType2.length;
			var length = fileType.length;
			var finalType2 = fileType2.substring(start2, length2);
			var finalType = fileType.substring(start, length);
			if (finalType != "jpg" || finalType2 != "jpg") {
				alert("抱歉，当前只支持.jpg格式的图片！");
				location.reload();
				return false;
			} 
			else {
				return true;
			}
		}
	}
</script>


</head>
<body>
<!-- banner -->
	<div class="mybanner jarallax">
		<div class="agile_dot_info one">
			<div class="container">
				<nav class="navbar navbar-default">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<h1>
						<a class="navbar-brand" href="index.html">室内平面设计交易</a>
					</h1>
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right"
					id="bs-example-navbar-collapse-1">
					<nav class="link-effect-8" id="link-effect-8">
					<ul class="nav navbar-nav">
						<li class="active"><a href="index.jsp">首页</a></li>
						<li><a href="findAllExample">看案例</a></li>
                        <li><a href="findneeds">找需求</a></li>
						<s:if test="%{#session.id==null}">
							<li><a href="login.jsp">登录</a></li>
							<li><a href="registerDes.jsp">注册</a></li>
						</s:if>
						<s:else>
							<li><a href="judge.action">个人主页</a></li>
							<li><a href="designerIndex.jsp">个人中心</a></li>
						</s:else>
					</ul>
					</nav>
				</div>
				</nav>

			</div>
		</div>
	</div>
	<div class="upload">
	<div class="uploadform">
	<span style="color:red"><s:fielderror/></span>
		<s:form action="uploadCase" method="post"
				enctype="multipart/form-data" theme="simple"
				onsubmit="return check()">
		
		<div class="line">
			<p>案例名称</p><s:textfield name="example.name"/>
			</div>
		<div class="line">
			<p>案例描述</p><s:textfield name="example.description" />
			</div>
		<div class="line">
			<p>设计风格 </p><s:textfield name="example.style"/>
			</div>
		<div class="line">
			<p>房屋面积</p><s:textfield name="example.area"/>
			</div>
		<div class="line">
			<div id="mybutton2">
		    	<a href="javascript:;" class="file">上传全景图
		    	<s:file id="UploadCase_upload" name="upload" onchange="getPhoto2()"/>
		    	</a>
		    </div>
		</div>
		
		<div class="ge_pic_icon_Infor2"></div>
		    
		<div class="line">
		    <div id="mybutton">
		   		<a href="javascript:;" class="file">上传平面图
    				 <s:file id="UploadCase_upload2" name="upload2" onchange="getPhoto()"/>
				</a>
		    </div>
	   </div>
		
		    <div class="ge_pic_icon_Infor"></div>
		    
		<div class="line">
		    <div class="subbutton">
				<s:submit value="立即上传" />
			</div>
		</div>
		
		</s:form>
		</div>
	</div>
</body>
</html>