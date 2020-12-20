<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>找他设计</title>
<link rel="stylesheet" href="css/layui.css">
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
<link rel="stylesheet" href="css/base.css">
<link rel="stylesheet" href="css/modals.css">
<link rel="stylesheet" href="css/message.css">
<link rel="stylesheet" href="css/hire.css">
</head>
<body>
<%--<a href="datachart.jsp">hh</a>--%>
<div class="contain_fluid header">
   <div class="contain_box clear">
       <span>专业小户型家装平台</span>
   </div>
</div>
      <div class="contain_fluid nav_bar">
        <div class="contain_box clear">
          <ul class="fl clear"><li class="fl"><a href="index.jsp">首页</a></li>
          <li class="fl"><a href="/Designers/List">找设计师</a></li>
          <li class="fl"><a href="/Requirements/List">找需求</a></li>
          <li class="fl"><a href="/Works/List">看案例</a></li></ul>
          <div class="fr public"><a class="request" href="/Requirements/Create">免费发布需求</a></div> 
       </div>
     </div>
     <div class="contain_box main clear">
       <div class="main_left fr">
        <input id="userID" type="hidden" value="be95ba3c-7f96-42a7-8adf-a72300e67689">
           <div class="newReq">
              <s:form action="subscribe" method="post">
              	
               <s:hidden name="employerId"  value="%{#session.employer.employerId}" />
               <s:hidden name="designerId"  value="%{#request.designer.designerId}" />
                
               <div class="layui-form-item title">
                  <label class="layui-form-label">  
                    <i class="red">*</i>填写需求标题：</label>
                       <div class="layui-input-block">
                          <s:textfield   cssClass="layui-input"  maxlength="50" cssStyle="width:250px;" placeholder="请输入标题" autocomplete="off" name="subscribe.title"/>
                            <span class="tip hide"><i class="icon icon-warning"></i>请输入需求标题（不能超过50个字符）</span></div></div>
            
                     <div class="layui-form-item content">
                       <label class="layui-form-label"><i class="red">*</i>填写需求描述：</label>
                         <div class="layui-input-block">
                            <s:textarea name="subscribe.description" cssClass="layui-textarea"  cssStyle="width: 520px; height: 160px; resize: none;  maxlength:4000" placeholder="请输入需求描述(风格、大小、所在地...)"/>
                               <span class="tip hide"><i class="icon icon-warning"></i>需求描述字符不得少于10个字符,最多4000字符</span></div></div>
   
                   <div class="layui-form-item budget">
                       <label class="layui-form-label"><i class="red">*</i>预算金额：</label>
                         <div class="layui-input-block">
                             <s:textfield name="subscribe.money" cssClass="layui-input" theme="simple"  cssStyle="width:120px;" maxlength="7"/><span>元</span>
                             <span class="tip hide"><i class="icon icon-warning"></i>请输入预算金额</span></div></div>

               <div class="layui-form-item">
                  <div class="layui-input-block">
                    <s:submit class="layui-btn sub-form" value="预约"/>
                    </s:form>          
                  </div>
              </div>
              
       </div>
     </div>

                   <div class="fl">
                               <div class="userInfo" id="userInfoBox">
                                  <div class="wd_whiteBg">
                                       <div class="wdr_bbt">
                                            <div class="wdr_imgBox">
                                                    <a href="/Userbe95ba3c-7f96-42a7-8adf-a72300e67689"  target="_blank">
                                                    <img src="/designer/designer/profilephoto/<s:property value="#request.designer.profilePhoto"/>">
                                                    </a>
                                        </div>
                              <div class="wdr_name">
                                     <a href="/Userbe95ba3c-7f96-42a7-8adf-a72300e67689"  target="_blank"> <!-- 账户名 --></a>
                             </div>
                            <div class="ff-c-gray">
                                         <span class="province"><s:property value="#request.designer.region" /></span>
                                        
                           </div>
                           <br>
                           <div class="wdr_bbt">
                              <div class="wdr_infoBox h-initial font_fal">
                                
                            <div class="wdr_info2">
                                    <span class="wdr_infoTitle">粉丝：<s:property value="#request.designer.fans" /></span>
                          </div>
                          <div class="wdr_info2">
                                 <span class="wdr_infoTitle">点赞：<s:property value="#request.designer.praise" /></span>
                           </div>
                         <div class="wdr_info2">
                                 <span class="wdr_infoTitle">评分：<s:property value="#request.designer.score" /></span>
                           </div>
                      
                
                 </div></div>
                    <div class="wdr_bbt"><div class="wdr_title"><b>联系方式：</b>
                           <div class="wdr_line wdr_line_noBlock"><b>Q&nbsp;Q：</b><b class="ff-c-gra"><s:property value="#request.designer.qq" /></b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>微信：</b><b class="ff-c-gra"><s:property value="#request.designer.wechat" /></b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>手机：</b><b class="ff-c-gra"><s:property value="#request.designer.phone" /></b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>邮箱：</b><b class="ff-c-gra"><s:property value="#request.designer.email" /> </b></div>
                     </div></div></div></div></div></div></div>

      <!--include ../Pages/list.pug-->
       <div class="contain_fluid footer">
         <div class="contain_box">
        <div class="links">
       <ul class="clear about_problem">
       <li class="fl"><a href="/Default/About" target="_blank">关于我们</a></li>
      <li class="fl"><a href="#" target="_blank">新手指南</a></li>
        <li class="fl"><a href="/Default/About#3" target="_blank">雇主问题</a></li>
      <li class="fl"><a href="/Default/About#3" target="_blank">设计师问题</a></li>
      <li class="fl"><a href="/Default/Agreement" target="_blank">用户协议</a></li>
      <li class="fl"><a href="/Default/About#5" target="_blank">版权声明</a></li>
      <li class="fl"><a href="/Default/About#6" target="_blank">交易保障</a></li>
    <li class="fl"><a href="/Default/About#2" target="_blank">商务合作</a></li>
    <li class="fl"><a href="/Default/About#4" target="_blank">联系我们</a></li></ul></div>
      <div class="copy_right"><a class="icp" href="http://www.miitbeian.gov.cn/" target="_blank">豫ICP备16038122号-3</a>
      <span class="v_line"></span><a href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=41019702002261" target="_blank">豫公网安备 41019702002261号</a>
     <span class="v_line"></span><span>Copyright ©2006-2018 中国设计网</span></div>
     </div>
    <script type="text/javascript">
        var msg=""+'${request.tipMessage}'; 
        if(msg!=""){ 
          alert(msg); 
      } 
     </script>
      </body></html>