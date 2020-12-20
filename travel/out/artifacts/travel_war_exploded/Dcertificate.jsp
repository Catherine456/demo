<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>设计师认证</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">	
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/global.css" media="all">
	<link rel="stylesheet" type="text/css" href="css/personal.css" media="all">
	
	
	
	
	<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#inFile").on("change",function () {
        var $file = $(this);
        var fileObj = $file[0];

        var windowURL = window.URL || window.webkitURL;
        var dataURL;
        var $img = $("img");

        if (fileObj && fileObj.files && fileObj.files[0]) {
            dataURL = windowURL.createObjectURL(fileObj.files[0]);
            $img.attr('src', dataURL);
        } else {
            dataURL = $file.val();
            var imgObj = document.getElementById("preview");
            imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
            alert(dataURL);
            imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

        }
    });
});
</script>
</head>
<body>

<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>上传设计师资格证</span><span style="color:red">${request.tip }</span>
		</header><!-- /header -->
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5" action="update2" method="post" enctype="multipart/form-data">
			    <div class="layui-form-item">
			      <label class="layui-form-label">当前状态：</label>
					<div class="layui-input-block" style="padding-top: 10px;">						
					${session.designer.status}</div>
				</div>
				<div class="layui-form-item">
			      <label class="layui-form-label">资格证照片</label>
					<div class="layui-input-block">
					<!--
					  <img src="/designer/designer/certificate/${session.designer.certificate }" style="width: 700px;height: 400px"/>
					  <input type="file" name="certificate"/>  -->
					  
					  	<input id="inFile"  name="certificate" type="file">
						<img src="/designer/designer/certificate/${session.designer.certificate}"  style="width: 800px;height: 400px"/>
					</div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">证书与奖项</label>
					<div class="layui-input-block">
						<textarea name="designer.prize" placeholder="在这里写你获得过的奖项及证书哦" class="layui-textarea">${session.designer.prize}</textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">确定</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript">
	layui.use(['form','upload'],function(){
         var form = layui.form();
         layui.upload({ 
             url: '' ,//上传接口 
             success: function(res){
              //上传成功后的回调 
              console.log(res) 
            } 
         });

	});
</script>
</body>
</html>