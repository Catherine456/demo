
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<sx:head parseContent="true" extraLocales="UTF-8" />
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
						<li><a href="findall.action">看案例</a></li>
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
				</div>
				<!--/.nav-collapse -->
			</div>
			<!-- Container -->
		</div>
		<!-- Nav Bar - Inner -->
	</div>
	<!-- Nav Bar --> </header>
	<!-- /container -->

	<div class="project_msg" style="margin-left: 250px;">
		<div class="_msg_info">
			<div
				style="margin: 25px 30px 0px 30px; overflow: hidden; border-bottom: 1px dotted #EDECED;">
				<div class="proj_name">
					<h2
						style="color: #333; font-family: 'Microsoft YaHei' ! important; font-size: 24px; font-weight: normal;">订单信息</h2>
				</div>
			</div>
			<div class="proj_massages"
				style="margin-top: 15px; padding-bottom: 20px; padding: 20px; border: 2px solid #d0d1d1;">
				<h5>雇主信息</h5>
				<div class="_massa">
					<div>
						<label style="display: inline-block">雇主姓名：</label>
						<s:property value="#request.orderr.employer.name" />
					</div>
					<div>
						<label style="display: inline-block">雇主电话：</label>
						<s:property value="#request.orderr.employer.phone" />
					</div>
					<div>
						<label style="display: inline-block">雇主QQ：</label>
						<s:property value="#request.orderr.employer.qq" />
					</div>
				</div>
			</div>
			<div class="proj_massages"
				style="margin-top: 15px; padding-bottom: 20px; padding: 20px; border: 2px solid #d0d1d1;">
				<h5>设计师信息</h5>
				<div class="_massa">
					<div>
						<label style="display: inline-block">设计师姓名：</label>
						<s:property value="#request.orderr.designer.name" />
					</div>
					<div>
						<label style="display: inline-block">设计师电话：</label>
						<s:property value="#request.orderr.designer.phone" />
					</div>
					<div>
						<label style="display: inline-block">设计师QQ：</label>
						<s:property value="#request.orderr.designer.qq" />
					</div>
				</div>
			</div>
			<div class="proj_massages"
				style="margin-top: 15px; padding-bottom: 20px; padding: 20px; border: 2px solid #d0d1d1;">
				<div class="_massa">
					<div>
						<label style="display: inline-block">订单编号：</label>
						<s:property value="#request.orderr.orderrId" />
					</div>
					<div>
						<label style="display: inline-block">订单标题：</label>
						<s:property value="#request.orderr.title" />
					</div>
					<div>
						<label style="display: inline-block">订单预算：</label>
						<s:property value="#request.orderr.money" />
						元
					</div>
					<div>
						<label style="display: inline-block">订单描述：</label>
						<s:property value="#request.orderr.description" />
					</div>
					<div>
						<label style="display: inline-block">设计完成时间：</label>
						<s:date name="#request.orderr.designTime"
							format="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div>
						<label style="display: inline-block">订单创建时间：</label>
						<s:date name="#request.orderr.beginTime"
							format="yyyy-MM-dd HH:mm:ss" />
					</div>
					<div>
						<label style="display: inline-block">订单状态：</label>
						<s:property value="#request.orderr.state" />
					</div>
					<s:if test='%{#request.orderr.state.equals("完成")}'>
						<div>
							<label style="display: inline-block">成交时间：</label>
							<s:date name="#request.orderr.finishTime"
								format="yyyy-MM-dd HH:mm:ss" />
						</div>
					</s:if>
				</div>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<s:if test='%{#request.orderr.state.equals("未付款")}'>


					<%--<div class="layui-input-inline">
						<form action="changeOrderrSt" method="post">
							<input type="hidden" name="state" value="取消" /> <input
								type="hidden" name="orderrId"
								value="<s:property value="#request.orderr.orderrId"/>" />
							<button id="cancel" class="layui-btn">
								取消订单
								</button>
						</form>
					</div>--%>


					<s:if test="%{#session.employer!=null}">
					<div class="layui-input-inline">
						<form action="pay" method="post" target="_blank">
							<s:hidden value="%{#request.orderr.orderrId}" name="orderrId"/>
							<button id="cancel" class="layui-btn">
								支付
							</button>
						</form>
					</div></s:if>
				</s:if>
				<s:elseif test='%{#request.orderr.state.equals("已付款")}'>
					<s:if test="%{#session.employer!=null}">
					<div class="layui-input-inline">
						<form action="" method="post">
							<input type="hidden" name="state" value="退款" /> <input
								type="hidden" name="orderrId"
								value="<s:property value="#request.orderr.orderrId"/>" />
							<button id="cancel" class="layui-btn">
								申请退款
								</NOtton>
								<%--还没做 --%>
						</form>
					</div>
					</s:if>
				</s:elseif>

					<s:if test="%{#session.designer!=null}">
						<s:if test='%{#request.orderr.state.equals("已付款")}'>
					<div class="layui-input-inline">
						<form name=alipayment action="finish"
							method="post">
							<s:hidden value="%{#request.orderr.orderrId}" name="orderrId"/>
							<button type="submit" id="cancel" class="layui-btn">确认完成</button>
						</form>
					</div></s:if></s:if>



			</div>
		</div>
	</div>
</body>
</html>