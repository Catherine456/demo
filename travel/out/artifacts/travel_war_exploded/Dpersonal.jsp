<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人资料</title>
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
</head>
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
<body>

<section class="layui-larry-box">
	<div class="larry-personal">
		<header class="larry-personal-tit">
			<span>个人资料</span>
		</header><!-- /header -->
		<s:if test="%{#session.designer!=null}"> 
		<div class="larry-personal-body clearfix">
			<form id="uploadpro" class="uploadpro" class="layui-form col-lg-5" action="update" method="post" enctype="multipart/form-data" onSubmit="return check()">			    
				<div class="layui-form-item">
					<label class="layui-form-label">身份类型</label>
					<div class="layui-input-block">
						<input type="text" name="identype"  autocomplete="off" class="layui-input layui-disabled" value="设计师" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">  
						<input type="text" name="designer.account" id="designer.account" value="${session.designer.account}" autocomplete="off"  class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">  
						<input type="password" name="designer.password" id="password" value="${session.designer.password}" autocomplete="off"  class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">  
						<input type="password" name="repassword" id="repassword" value="${session.designer.password}" autocomplete="off"  class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
				<label class="layui-form-label">修改头像</label>
					<div class="layui-input-block">
					  <input type="hidden" name="designer.profilePhoto" value="${session.designer.profilePhoto}" autocomplete="off"  class="layui-input">
					<!--   <img src="/designer/designer/profilephoto/${session.designer.profilePhoto}" style="width: 200px;height: 200px"/>
					  <input type="file" name="profile" onchange="getPhoto()"/> --> 
 				  	<input id="inFile"  name="profile" type="file">
						<img src="designer/designer/profilephoto/${session.designer.profilePhoto}"  style="width: 100px;height: 100px">

					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-block">
						<input type="text" name="designer.name"  autocomplete="off" class="layui-input" value="${session.designer.name}" placeholder="在此输入你的真实姓名哟">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-block">
						<input type="text" name="designer.IDNumber"  autocomplete="off" class="layui-input" value="${session.designer.IDNumber}" placeholder="在此输入你的身份证号哟">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">			
					<s:if test="%{#session.designer.sex==0}">		
					  <input type="radio" name="designer.sex" value="0" title="男" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><span>男</span></div>
					  <input type="radio" name="designer.sex" value="1" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><span>女</span></div>
					</s:if>
					<s:else>
					  <input type="radio" name="designer.sex" value="0" title="男"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><span>男</span></div>
					  <input type="radio" name="designer.sex" value="1" title="女" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><span>女</span></div>
					</s:else>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所在地</label>
					<div class="layui-input-block">
					  <input type="text" name="designer.region"  autocomplete="off" class="layui-input" value="${session.designer.region}" placeholder="在此输入你的地址哟">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-block">
						<input type="text" name="designer.phone"  autocomplete="off" class="layui-input" value="${session.designer.phone}" placeholder="在此输入你的手机号哟">
				    </div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="text" name="designer.email"  autocomplete="off" class="layui-input" value="${session.designer.email}" placeholder="在此输入你的邮箱哟">
				    </div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">QQ</label>
					<div class="layui-input-block">
						<input type="text" name="designer.qq"  autocomplete="off" class="layui-input" value="${session.designer.qq}" placeholder="在此输入你的qq号哟">
				    </div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">微信</label>
					<div class="layui-input-block">
						<input type="text" name="designer.wechat"  autocomplete="off" class="layui-input" value="${session.designer.wechat}" placeholder="在此输入你的微信号哟">
				    </div>
				</div>
				<div class="layui-form-item layui-form-text">
					<label class="layui-form-label">个人简介</label>
					<div class="layui-input-block">
						<textarea name="designer.introduction" placeholder="这个人很懒，什么都没有写呢" class="layui-textarea">${session.designer.introduction}</textarea>
					</div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">保存修改</button>
					</div>
				</div>
				<input type="hidden" name="designer.designerId" value="${session.designer.designerId}">
			    <input type="hidden" name="designer.score" value="${session.designer.score}">
			    <input type="hidden" name="designer.fans" value="${session.designer.fans}">
			    <input type="hidden" name="designer.praise" value="${session.designer.praise}">
			    <input type="hidden" name="designer.profound" value="${session.designer.profound}">
			    <input type="hidden" name="designer.prize" value="${session.designer.prize}">
			    <input type="hidden" name="designer.status" value="${session.designer.status}">
			    <input type="hidden" name="designer.certificate" value="${session.designer.certificate}">
			    <input type="hidden" name="designer.message" value="${session.designer.message}">
			    <input type="hidden" name="designer.status1" value="${session.designer.status1}">
			    <input type="hidden" name="designer.money1" value="${session.designer.money1}">
			</form>
		</div>
		</s:if>
		<s:else>
		<div class="larry-personal-body clearfix">
			<form class="layui-form col-lg-5" action="update3" method="post" enctype="multipart/form-data" onSubmit="return check()">			    
				<div class="layui-form-item">
					<label class="layui-form-label">身份类型</label>
					<div class="layui-input-block">
						<input type="text" name="identype"  autocomplete="off" class="layui-input layui-disabled" value="用户" disabled="disabled">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">用户名</label>
					<div class="layui-input-block">  
						<input type="text" name="employer.account"  value="${session.employer.account}" autocomplete="off"  class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">密码</label>
					<div class="layui-input-block">  
						<input type="password" name="employer.password"  value="${session.employer.password}" autocomplete="off"  class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">确认密码</label>
					<div class="layui-input-block">  
						<input type="password" name="repassword"  value="${session.employer.password}" autocomplete="off"  class="layui-input">
					</div>
				</div>
				<div class="layui-form-item">
				<label class="layui-form-label">修改头像</label>
					<div class="layui-input-block">
					  <input type="hidden" name="employer.profilePhoto" value="${session.employer.profilePhoto}" autocomplete="off"  class="layui-input">
					  <img src="designer/employer/profilephoto/${session.employer.profilePhoto}" style="width: 200px;height: 200px"/>
					  <input type="file" name="uprofile"/>
					</div>
					
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">真实姓名</label>
					<div class="layui-input-block">
						<input type="text" name="employer.name"  autocomplete="off" class="layui-input" value="${session.employer.name}" placeholder="在此输入你的真实姓名哟">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">身份证号</label>
					<div class="layui-input-block">
						<input type="text" name="employer.IDNumber"  autocomplete="off" class="layui-input" value="${session.employer.IDNumber}" placeholder="在此输入你的身份证号哟">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">性别</label>
					<div class="layui-input-block">	
					<s:if test="%{#session.employer.sex==0}">					
					  <input type="radio" name="employer.sex" value="男" title="男" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><span>男</span></div>
					  <input type="radio" name="employer.sex" value="女" title="女"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><span>女</span></div>
					</s:if>
					<s:else>
					  <input type="radio" name="employer.sex" value="0" title="男"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><span>男</span></div>
					  <input type="radio" name="employer.sex" value="1" title="女" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><span>女</span></div>					
					</s:else>
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">所在地</label>
					<div class="layui-input-block">
					  <input type="text" name="employer.region"  autocomplete="off" class="layui-input" value="${session.employer.region}" placeholder="在此输入你的地址哟">
					</div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">手机号码</label>
					<div class="layui-input-block">
						<input type="text" name="employer.phone"  autocomplete="off" class="layui-input" value="${session.employer.phone}" placeholder="在此输入你的手机号哟">
				    </div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">邮箱</label>
					<div class="layui-input-block">
						<input type="text" name="employer.email"  autocomplete="off" class="layui-input" value="${session.employer.email}" placeholder="在此输入你的邮箱哟">
				    </div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">QQ</label>
					<div class="layui-input-block">
						<input type="text" name="employer.qq"  autocomplete="off" class="layui-input" value="${session.employer.qq}" placeholder="在此输入你的qq号哟">
				    </div>
				</div>
				<div class="layui-form-item">
					<label class="layui-form-label">微信</label>
					<div class="layui-input-block">
						<input type="text" name="employer.wechat"  autocomplete="off" class="layui-input" value="${session.employer.wechat}" placeholder="在此输入你的微信号哟">
				    </div>
				</div>
				
				<div class="layui-form-item">
					<div class="layui-input-block">
						<button class="layui-btn" lay-submit="" lay-filter="demo1">保存修改</button>
					</div>
				</div>
				<input type="hidden" name="employer.employerId" value="${session.employer.employerId}">
			    <input type="hidden" name="employer.hmpgbkg" value="${session.employer.hmpgbkg}">
			</form>
		</div>
		
		</s:else>
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

<script language="JavaScript" type="text/javascript">  
function check(){
	var password= document.getElementById("password");
	var repassword = document.getElementById("repassword");
	if(password.value!=repassword.value){
		alert("两次密码输入不一致");
		return false;
	}
}
</script>
</body>
</html>