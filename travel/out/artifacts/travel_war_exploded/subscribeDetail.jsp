
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 
 
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language="JavaScript" type="text/javascript">
    // Dojo configuration
    djConfig = {
        isDebug: false,
        bindEncoding: "UTF-8"
          ,baseRelativePath: "/designer2.0_(200)/struts/dojo/"
          ,baseScriptUri: "/designer2.0_(200)/struts/dojo/"
          ,extraLocale: [
        		"UTF-8"
          ]
         ,parseWidgets : true
        
    };
</script>
  <script language="JavaScript" type="text/javascript"
        src="/designer2.0_(200)/struts/dojo/struts_dojo.js"></script>

<script language="JavaScript" type="text/javascript"
        src="/designer2.0_(200)/struts/ajax/dojoRequire.js"></script>
<link rel="stylesheet" href="/designer2.0_(200)/struts/xhtml/styles.css" type="text/css"/>

<script language="JavaScript" src="/designer2.0_(200)/struts/utils.js" type="text/javascript"></script>
<script language="JavaScript" src="/designer2.0_(200)/struts/xhtml/validation.js" type="text/javascript"></script>
<script language="JavaScript" src="/designer2.0_(200)/struts/css_xhtml/validation.js" type="text/javascript"></script> 
<link type="text/css" rel="stylesheet" href="css/common.css" />
 <link href="css/bootstrap3.css" rel="stylesheet">
    <link href="css/bootstrap-responsive3.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Extra Styles, not needed for Mega Menu or Boostrap -->
	<link href="css/style3.css" rel="stylesheet">
	<link rel="stylesheet" href="layui/css/layui.css">
	<!-- Mega Menu Style, you kinda really need Bootstrap in order for this to work -->
	<link href="css/mega-menu3.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
 <script type="text/javascript">  
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
						<li><a href="findall.action">看案例</a></li>
						<li><a href="findneeds">找需求</a></li>
								<li><a href="4menus.htm">论坛</a></li>
								<li><a href="styles.htm">装修攻略</a></li>
								
						
							<li><a href="judge.action">我的主页</a></li>
						  
							<li><a href="designerIndex.jsp">个人中心</a></li>
						  
						  
						
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
					<h2 style="color: #333;font-family: 'Microsoft YaHei' ! important;font-size: 24px;font-weight: normal;">预约信息</h2>
				</div>
			</div>
			
			<form action="" name="subform" method="post" >
			<input type="hidden" name="subscribe.subscribeID"  value="<s:property value="#request.subscribe.subscribeID" />" />
			
			
			<div class="proj_massages" style="margin-top: 15px;padding-bottom: 20px;padding: 20px;border: 2px solid #d0d1d1;">
			    <h5>雇主信息</h5>	
				<div class="_massa">
					<div><label style="display: inline-block">雇主姓名：</label><s:property value="#request.subscribe.subscriber.name" /></div>
					<div><label style="display: inline-block">雇主电话：</label><s:property value="#request.subscribe.subscriber.phone" /></div>
					<div><label style="display: inline-block">雇主QQ：</label><s:property value="#request.subscribe.subscriber.qq" /></div>
				</div>
			</div>
			
			<div class="proj_massages" style="margin-top: 15px;padding-bottom: 20px;padding: 20px;border: 2px solid #d0d1d1;">
				<div class="_massa">
					<div><label style="display: inline-block">预约标题：</label><s:property value="#request.subscribe.title" /></div>	
					<div><label style="display: inline-block">预约预算：</label><s:property value="#request.subscribe.money" /></div>
					<div><label style="display: inline-block">预约描述：</label><s:property value="#request.subscribe.description" /></div>
					<div><label style="display: inline-block">预约时间：</label><s:property value="#request.subscribe.time" /></div>
				</div>
			</div>
				<s:if test="%{#session.designer!=null}">
					<s:if test="%{#session.subscribe.status == 1}">
				<input type="button" onclick="window.subform.action='gotoGenerateOrder';subform.submit()" value="接受" style="width: 100px;background: #c47e38;border: 0px;padding: 5px;margin-left: 20px;color: white;font-size: 15px;"/>
				<input type="button" onclick="window.subform.action='reject';subform.submit()"  value="拒绝" style="width: 100px;background: #4e4e3e;border: 0px;padding: 5px;margin-left: 20px;color: white;font-size: 15px;" />
					</s:if>
				</s:if>



			</form>
			<s:if test="%{#session.employer!=null}">
			<s:if test="%{#request.subscribe.status == 1}">
				<div class="layui-input-inline">
					<form action="cancelSub.action" method="post">
						<s:hidden value="%{#request.subscribe.subscribeID}" name="subscribeID"/>
						<button id="cancel" class="layui-btn" type="submit">
							取消订单
						</button>
					</form>
				</div></s:if></s:if>
			<%--<s:if test="%{#session.employer!=null}">
			<div class="layui-input-inline">
				<s:form action="pay" method="post"
						target="_blank" >
					<input type="hidden" name="state" value="已支付" /> <input
						type="hidden" id="WIDout_trade_no" name="orderr.orderrId"
						value="<s:property value="#request.orderr.orderrId"/>" /> <input
						type="hidden" id="WIDsubject" name="WIDsubject"
						value="<s:property value="#request.orderr.title"/>" /> <input
						type="hidden" id="WIDtotal_amount" name="WIDtotal_amount"
						value="<s:property value="#request.orderr.money"/>" /> <input
						type="hidden" id="WIDbody" name="WIDbody"
						value="<s:property value="#request.orderr.description"/>" />
					<button type="submit" id="cancel" class="layui-btn">支付</button>
				</s:form>
			</div></s:if>--%>
		</div>
        <div class="layui-form-item">
        <div class="layui-input-block">
            
        
        </div>
    </div>
</div>
</body>
</html>


