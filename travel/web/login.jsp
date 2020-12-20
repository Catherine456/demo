<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<s:head theme="xhtml" />
<sx:head parseContent="true" extraLocales="UTF-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
<link href="css/layout_log_reg.css" rel="stylesheet" type="text/css" />
</head>
<body style='overflow: hidden; position: fixed; width: 100%; height: 100%; background: url("images/s5.jpg") no-repeat; background-size: auto auto; background-size: auto auto; background-size: cover;'>
	<div class="content">
		<div class="title">
			<h4>登录</h4>
		</div>

		<div class="form"><s:fielderror/>
			<form action="login" method="post" namespace="/">
				<s:textfield name="designer.phone" placeholder="手机号"/><br>
				<s:password name="designer.password"  placeholder="密码"/>
				<%--<input type="text" name="designer.phone" placeholder="手机号" />
				<input type="password" name="designer.password" placeholder="密码" />--%>
				<div class="buttons">
					<input type="submit" value="登录" style="font-size: 20px; line-height: 2px; color: #fbf9f9; background: #d66f3d;" />
					<div class="link">
						没有账号？<a href="registerEmp.jsp">注册</a>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript" charset="UTF-8" language="javascript">
		var msg=""+'${request.tip}';
		if(msg!=""){
			alert(msg);
		}
	</script>
</body>
</html>