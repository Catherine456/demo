 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%> 
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%> 
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sx:head parseContent="true" extraLocales="UTF-8"/> 
<link type="text/css" rel="stylesheet" href="css/common.css" />
 <link href="css/bootstrap3.css" rel="stylesheet">
    <link href="css/bootstrap-responsive3.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Extra Styles, not needed for Mega Menu or Boostrap -->
	<link href="css/style3.css" rel="stylesheet">
	
	<!-- Mega Menu Style, you kinda really need Bootstrap in order for this to work -->
	<link href="css/mega-menu3.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<style>
.cancel{
float:right;
padding:0px 40px;
text-align: center;
line-height: 33px;
height: 33px;
background: #c0c0c0;
color: #fff;
border-radius: 5px;
 text-decoration: none;
 font-family: '微软雅黑';
 font-size: 14px;
 margin-top: 10px;
 }
 
 .oneblock{
 display: inline-block;

margin-left: 20px;

border: 3px solid #959088;

padding: 15px;

text-align: center;

margin-top: 10px;
 }
 .oneblock ul
 {list-style:none;}
 
 
 .oneblock li
 {list-style:none;}
 
 .oneblock img
 {width: 100px;}
 
 .oneblock button
 {
 width: 100px;

height: 30px;

margin-top: 10px;

background: #ee8b27;

color: white;

border: 0px;
 }
 
 .oneblock a
 {font-size: 14px;}
 
 
</style>
<script type="text/javascript">   
function signup(NeedsID)
 {
	 if(confirm("确认申请？")){
			$.post(
				"SignUp.action",
				{needsId:NeedsID},
				function(result){
					var ret = $.parseJSON(result);
					if(ret.success){
						alert("申请成功");
						location.reload();
					}
					else{
						alert("申请失败");
					}
				}
			);
	}
}

</script>
<script type="text/javascript">
function cancelSignup(NeedsID)
 {
	 if(confirm("确认取消？")){
			$.post(
				"cancelSignUp.action",
				{needsId:NeedsID},
				function(result){
					var ret = $.parseJSON(result);
					if(ret.success){
						alert("取消成功");
						location.reload();
					}
					else{
						alert("取消失败");
					}
				}
			);
	}
}

</script>
<script type="text/javascript">   
function cancelNeeds(NeedsID)
 {
	 if(confirm("确认取消？")){
			$.post(
				"cancelNeeds.action",
				{needsId:NeedsID},
				function(result){
					var ret = $.parseJSON(result);
					if(ret.success){
						alert("取消成功");
						location.reload();
					}
					else{
						alert("取消失败");
					}
				}
			);
	}
}

</script>
</head> 
<body>
<header class="container" >
	
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</a>
					
						<div class="nav-collapse collapse">
							<ul class="nav">
								<li><a href="index.jsp">首页</a></li>
						<li><a href="findAllExample">看案例</a></li>
						<li><a href="findneeds">找需求</a></li>
								<li><a href="4menus.htm">论坛</a></li>
								<li><a href="styles.htm">装修攻略</a></li>
								<s:if test="%{#session.id==null}"> 
							<li><a href="login.jsp">登录</a></li>
							<li><a href="contact.html">注册</a></li>
						</s:if>
						<s:else>
							<li><a href="judge.action">我的主页</a></li>
						  <s:if test="%{#session.designer!=null}">
							<li><a href="designerIndex.jsp">个人中心</a></li>
						  </s:if>
						  <s:elseif test="%{#session.employer!=null}">
							<li><a href="employerIndex.jsp">个人中心</a></li>
						  </s:elseif>
						</s:else>
							</ul>
						</div><!--/.nav-collapse -->
				</div><!-- Container -->
			</div><!-- Nav Bar - Inner -->
		</div><!-- Nav Bar -->
	
	</header><!-- /container -->

<div class="project_msg" style="margin-left: 250px;">
		<div class="_msg_info">
			<div style="margin: 25px 30px 0px 30px;overflow: hidden;border-bottom: 1px dotted #EDECED;">
				<div class="proj_name">
					<h2 style="color: #333;font-family: 'Microsoft YaHei' ! important;font-size: 24px;font-weight: normal;"><s:property value="#request.needs.title"/></h2>
					<div style="color: #666;margin-top: 5px;margin-bottom: 5px;">
                        <span><s:date name="#request.needs.time1" format="yyyy-MM-dd HH:mm:ss"/>发布</span>
                        <span style="border-left:1px solid #ddd;padding-left:10px;padding-right:10px;margin-left:10px;margin-right:10px;">发布者：<s:property value="#request.needs.employer.account" /></span>
                    </div>
				</div>
				<s:if test="%{#session.designer!=null}">
				<div class="btne apply_for">
				<div>
				<s:if test="%{#request.hasSignup}">
				<button class="cancel"  onclick="cancelSignup(${needs.needsId})">取消接单</button>
				</s:if>
				<s:else>
				<button class="detail"  onclick="signup(${needs.needsId})">申请接单</button>
				</s:else>
				</div>
		        <div style="float:right;padding:20px 40px;color: #666;">已有<span id="number"  style="color:red;"><s:property value="#request.needs.enrollment"/></span>位设计师报名</div>
				</div>
                </s:if>
                <%--<s:elseif test="%{#session.employer!=null}">
                <div class="btne apply_for">
				<div><button id="cancel" class="detail"   onclick="cancelNeeds(${needs.needsId})">取消需求</button></div>
				</div>
                </s:elseif>--%>
			</div>
	
			<div class="proj_massages" style="margin-top: 15px;padding-bottom: 20px;padding: 20px;border: 2px solid #d0d1d1;">
				<div class="_massa">
					<div><label style="display: inline-block">项目地点：</label><s:property value="#request.needs.city"/></div>
					<div><label style="display: inline-block">项目风格：</label><s:property value="#request.needs.style"/></div>
					<div><label style="display: inline-block">项目规模：</label><em><s:property value="#request.needs.area"/></em>m<sup>2<sup></div>
					<div><label style="display: inline-block">设计预算：</label><em><s:property value="#request.needs.money"/></em></div>
					<div><label style="display: inline-block">设计截止时间：<s:date name="#request.needs.time3" format="yyyy-MM-dd"/></div>
					<div><label style="display: inline-block">报名截止时间：<s:date name="#request.needs.time2" format="yyyy-MM-dd"/></div>
					<div class="proj_devise" style="height: 50px;padding-bottom: 0px;">
			        	<div style="color: #333;" style="display: inline-block">设计要求</div>
				        <div style="line-height: 24px;color: #666;"><s:property value="#request.needs.description"/></div>
			        </div>
				</div>
			</div>
			<s:if test="%{#session.employer.employerId.equals(#request.needs.employer.employerId)}">
			<div class="designer" style="margin: 25px 30px 0px 30px;overflow: hidden;border-bottom: 1px dotted #EDECED;" >
				<h4>已报名的设计师</h4>				
				<s:iterator value="#request.needs.designers">
					<div class="col-sm-4 designer-grids oneblock">
						<img src="/designer/designer/profilephoto/<s:property value="profilePhoto"/>" alt=" "
							class="img-responsive" />
						<h5>
							<li>设计师昵称: <s:property value="account" /></li>
						</h5>
						<h5>
							<li>联系方式: <s:property value="phone" /></li>
						</h5>
						<h5>
							<li>所在地： <s:property value="region" /></li>
						</h5>
						<h5>
							<li>赞数： <s:property value="praise" /></li>
						</h5>
						
						<table>
						    <li>
							<a href="putDesigner.action?designer.designerId=<s:property value='designerId'/>">查看主页</a>
							<br>
							</li>
							<form action="SelectDes" method="post">
							<input type="hidden" name="needs.needsId"  value="<s:property value="#request.needs.needsId"/>" />
							<input type="hidden" name="designer.designerId"  value="<s:property value='designerId'/>" />
							<button id="select"  type="submit" >挑选</button>
							</form>
							<br>
						</table>
					</div>
				</s:iterator>
			</div>
			</s:if>
		</div>
</div>
</body>
</html>