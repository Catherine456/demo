<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<s:head theme="xhtml"/>
<sx:head parseContent="true" extraLocales="UTF-8"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录界面</title>
<link href="css/layout_log_reg.css" rel="stylesheet" type="text/css" /> 
<link href="css/regLogin.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="js/regLogin.js"></script>
<script language="Javascript" type="text/javascript">
  	   function custCheck(){
  	      var pwd=document.getElementById("pwd");
  	      var repwd=document.getElementById("repwd");
  	    if(pwd.value!=repwd.value){
  	         alert("两次密码不一致!");
  	         return false;
  	      }
  	   }
</script>
</head>
<body style='overflow: hidden;position: fixed;width: 100%;height: 100%;background: url("images/s5.jpg") no-repeat;background-size: auto auto;background-size: auto auto;background-size: cover;'>
  <div class="page-container index_form">
           
<div class="form_container reg_form_container">
    <div class="tab_box clear" id="regSort"> 
        <span class="fl tab_item" data-type="0"><a href="registerEmp.jsp">用户注册</a></span>
        <span class="fr tab_item active" data-type="1">设计师注册</span>
    </div>
    <input type="hidden" id="userType" value="1" />
      <s:form action="registerDes" method="post" onSubmit="return custCheck()">
          <s:fielderror/>
        <div class="form_con">
            <div class="placeholder"><i class="fc_icon fc_icon_phone"></i><span class="placeholder_txt">请输入手机号</span></div>
            <s:textfield name="designer.phone" id="mobile"  cssClass="ctrlReg"/>
          <!--    <input id="mobile" class="ctrlReg" type="text" ajaxurl="/ValidateAsync/CheckAccount" name="account">  -->
        </div>
        <div class="form_con">
            <div class="placeholder"><i class="fc_icon fc_icon_mm"></i><span class="placeholder_txt">密码</span></div>
            <s:password id="pwd" name="designer.password" cssClass="ctrlReg"/>
         <!--    <input id="pwd" class="ctrlReg" type="password" name="pwd"> -->
        </div>
        <div class="form_con">
            <div class="placeholder"><i class="fc_icon fc_icon_mm"></i><span class="placeholder_txt">确认密码</span></div>
            <s:password name="repassword" id="repwd" cssClass="ctrlReg"/>
        </div>   
        <div class="form_con form_con_captcha">
            <div class="placeholder"><i class="fc_icon fc_icon_sms"></i><span class="placeholder_txt">短信验证码</span></div>
            <input id="captcha" class="ctrlReg" style="width:246px;margin-right: 6px;" type="text" name="captcha" autocomplete="off">
            <button type="button" class="ani_transition btn_sendCode" data-type="1">获取验证码</button>
            <button type="button" class="ani_transition btn_disabled hide"><span id="seconds"></span>s后重新发送</button>
        </div>
       
        <div class="tip_container">
            <span class="tip_msg" id="tipMsg"></span>
        </div>
        <s:submit value="立即注册"/>
        <span>已有账号？</span>
        <a href="login.jsp" class="goLogin">去登录</a>
      
</s:form></div>

            
        </div>
 <script type="text/javascript">
        var msg=""+'${request.tipMessage}'; 
        if(msg!=""){ 
          alert(msg); 
      } 
        </script>   
    
</body>
</html>