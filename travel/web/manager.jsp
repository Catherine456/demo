
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="cn.edu.zjut.po.Designer"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>管理员个人中心</title>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css"
		  media="all">
	<link rel="stylesheet" type="text/css" href="css/DIndexstyle.css">
	<link rel="stylesheet" href="css/layui.css">
	<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
	<link rel="stylesheet" href="css/base.css">
	<link rel="stylesheet" href="css/modals.css">
	<link rel="stylesheet" href="css/message.css">
	<link rel="stylesheet" href="css/requirements1.css">
</head>
<body>




<div class="layui-tab layui-tab-card my-tab" lay-filter="card"
	 lay-allowClose="true">
	<div class="contain_box">
		<div class="thead clear">
			<span class="col_01 thead_title">设计师编号</span> <span
				class="col_02 thead_startTime">设计师账户</span> <span
				class="col_03 thead_startTime">推优费</span> <span
				class="col_05 thead_startTime"></span>
		</div>
		<%
			int i = 0;
		%>
		<s:if test="#session.Designerss.size()!=0">
			<s:iterator value="#session.Designerss" var="designer">
				<%
					if (i < 4) {
				%>
				<s:if
						test="#designer.status1!=null  && (#designer.status1.intValue()==1  || #designer.status1.intValue()==2)">
					<div class="main_requirements">
						<ul class="list_contain">
							<li class="clear list">
								<div class="col_01 fl req_title">
									<h4>
										<b><s:property value="designerId" /></b>
									</h4>
								</div>
								<div class="col_02 fl req_sort">
									<span><s:property value="account" /></span>
								</div>
								<div class="col_03 fl req_sort">
									<span><s:property value="money1" /></span>
								</div> <s:if test="status1.intValue()==1">
								<div class="col_04 fl req_status">
									<a
											href="recommendD.action?designer.designerId=<s:property value='designerId'/>"><font
											color="red">推优</font></a>
								</div>
							</s:if> <s:if test="status1.intValue()==2">
								<div class="col_04 fl req_status">
									<font color="red">已推优</font>
								</div>"
							</s:if>
							</li>
						</ul>
					</div>
				</s:if>
				<%
						i = i + 1;
					}
				%>
			</s:iterator>
		</s:if>
		<s:else>
			<h1>当前没有推优预约哦</h1>
		</s:else>
	</div>

	<script type="text/javascript">
		var col_list = '<select id="col_select"><option value="451354">笔记</option><select>';
		$(function() {
			$('.edit').deleteWorks();
			$('.edit').shareWorks();
		});
	</script>
</div>

<script src="http://img.cndesign.com/Scripts/header.js"
		type="text/javascript"></script>
<div class="back">
	<i></i>
</div>

</div>

<!-- footer -->
<div class="layui-footer my-footer"></div>
</div>

<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/vip_comm.js"></script>
<script type="text/javascript">
	layui
			.use(
					[ 'layer', 'vip_nav' ],
					function() {

						// 操作对象
						var layer = layui.layer, vipNav = layui.vip_nav, $ = layui.jquery;

						// 顶部左侧菜单生成 [请求地址,过滤ID,是否展开,携带参数]
						vipNav.top_left('./json/nav_top_left.json',
								'side-top-left', false);
						// 主体菜单生成 [请求地址,过滤ID,是否展开,携带参数]
						vipNav.main('./json/nav_main.json', 'side-main',
								true);

						// you code ...

					});
</script>
</body>
</html>