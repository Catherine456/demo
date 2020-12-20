<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="S" uri="/struts-tags" %>
<%@ page import="cn.edu.zjut.po.Designer" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>认证</title>
    <link href="http://img.cndesign.com/Scripts/admin/jQuery.jcrop/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
    <link href="http://img.cndesign.com/Content/headFoot.css" rel="stylesheet" type="text/css" />
    <link href="http://img.cndesign.com/Content/base.css" rel="stylesheet" type="text/css" />
    <link href="http://img.cndesign.com/Content/newBase.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/modals.css">
    <link rel="stylesheet" href="css/message.css">
    <link rel="stylesheet" href="css/requirements.css">
    <link rel="stylesheet" href="css/hire.css">
    <script src="http://img.cndesign.com/Scripts/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="http://img.cndesign.com/Scripts/jquery-ui.js" type="text/javascript"></script>
</head>
<body>
<div class="head container-fluid">
    <div class="content_box nav_box clear" style="position: relative;">
          <a class="nav_logo lf" href="index.jsp">
           <img src="images/bk.jpg" heigth="30" width="255">
        </a>
        <div class="navbar_collapse lf"></div>
        <ul class="navbar_ul lf clear" style="display: none;">
                <li class="navbar_li lf nb_noneUl ">
                        <a href="index.jsp" target="_parent" class="navbar_a">首页</a>
                </li>
                <li class="navbar_li lf  ">
                        <a href="needList.jsp" class="navbar_a">需求<b class="trangle"></b></a>         
                </li>
                <li class="navbar_li lf  ">
                        <a href="selectDesigner.jsp" class="navbar_a">设计师<b class="trangle"></b></a>    
                </li>   
               <li class="navbar_li lf  ">
                        <a href="projects.jsp" class="navbar_a">搜索<b class="trangle"></b></a>    
                </li>    
        </ul>
            <div class="top_login rf clear">
                <div class="person_info lf">
                    <a href="adminIndex.jsp">
                        <img src="http://img.cndesign.com/Content/images/tx_130.jpg">
                    </a>
                    <ul class="mine_ul">
                        <li class="mine_li">
                            <a href="./exit">退出</a>
                        </li>
                    </ul>
                </div>
            </div>
       
        <!-- 登录后 END -->
    </div>
</div>

<!-- 首屏 导航条 -->
<div class="nav contain-fluid" style="display: block; ">
    <div class="content_box nav_box_v1 clear">
        <div class="lf zryd-nav">
            <ul class="nav_ul_v1 lf clear">
                    <li class="nav_li_v1">
                        <a class="nav_a_v1  " href="index.jsp" target="_parent">
                            首页
                        </a>
                    </li>
                    <li class="nav_li_v1">
                        <a class="nav_a_v1 haveSub " href="needList.jsp">
                           需求                 
                        </a>
                    </li>
                    <li class="nav_li_v1">
                        <a class="nav_a_v1 haveSub " href="selectDesigner.jsp" target="_parent">
                         设计师                   
                        </a>
                    </li>
                    <li class="nav_li_v1">
                        <a class="nav_a_v1 haveSub " href="projects.jsp" target="_parent">
                           搜索
                        </a>
                    </li>
                    
            </ul>
              
            <!-- 首屏 导航条 END -->
        </div>
       
    </div>
</div>

     <div class="contain_box main clear">
       <div class="main_left fr">
           <div class="newReq">
              <s:form action="authen" method="post">
               <div class="layui-form-item title">
                  <label class="layui-form-label">姓名：</label>
                       <div class="layui-input-block">
                          <s:textfield   cssClass="layui-input"  maxlength="20" cssStyle="width:120px;"  autocomplete="off" name="designer.name" value="%{#request.designer.name}" readonly="true"/>
                          </div></div>
            
                     <div class="layui-form-item content">
                       <label class="layui-form-label">身份证号码：</label>
                         <div class="layui-input-block">
                             <s:textfield name="designer.IDNumber" cssClass="layui-input" theme="simple"  cssStyle="width:250x;" maxlength="50" value="%{#request.designer.IDNumber}" readonly="true"/>
                              </div></div>
   
                   <div class="layui-form-item budget">
                       <label class="layui-form-label">自我介绍：</label>
                         <div class="layui-input-block">
                            <s:textarea name="designer.introduction" cssClass="layui-textarea"  cssStyle="width: 520px; height: 100px; resize: none;  maxlength=2000" value="%{#request.designer.introduction}" readonly="true"/>
                           </div></div>
                  <div class="layui-form-item budget">
                       <label class="layui-form-label">证书与奖项：</label>
                         <div class="layui-input-block">
                         <s:textarea name="designer.prize" cssClass="layui-textarea"  cssStyle="width: 520px; height: 100px; resize: none;  maxlength=2000" value="%{#request.designer.prize}" readonly="true"/>
                           </div></div>
           <div class="layui-form-item budget">
                       <label class="layui-form-label">设计师资格证：</label>
                         <div class="layui-input-block">
                         <s:hidden name="designer.certificate"  value="%{#request.designer.certificate}"/>
                         <img src="designer/designer/certificate/<s:property value="#request.designer.certificate"/>" heigth="130" width="130"  border="0" />
                           </div></div>
                           <div class="layui-form-item title">
                  <label class="layui-form-label">设计师等级：</label>
                       <div class="layui-input-block">
                          <s:textfield  cssClass="layui-input"  maxlength="20" cssStyle="width:100px;" name="designer.title" value="%{#request.designer.title}"/>
                          </div></div>
                  <s:if test="#request.designer.status != '已审核'">
               <div class="layui-form-item">
                  <div class="layui-input-block">
                    <s:submit class="layui-btn sub-form" value="认证"/>        
                  </div>
              </div>
              </s:if>
       </div>
     </div>

                   <div class="fl">
                               <div class="userInfo" id="userInfoBox">
                                  <div class="wd_whiteBg">
                                       <div class="wdr_bbt">
                                            <div class="wdr_imgBox">
                                                    <a href="/Userbe95ba3c-7f96-42a7-8adf-a72300e67689"  target="_blank">
                                                    <img src="/designer/designer/profilephoto/<s:property value="%{#request.designer.profilePhoto}"/>"/>
                                                    </a>
                                        </div>
                              <div class="wdr_name">
                                  <s:hidden name="designer.designerId"  value="%{#request.designer.designerId}"/><s:property value="#request.designer.designerId"/>
                             </div>
                            <div class="ff-c-gray">
                                         <span class="province"><s:hidden name="designer.region"  value="%{#request.designer.region}"/><s:property value="#request.designer.region"/></span>                  
                           </div>
                           <br>
                           <div class="wdr_bbt">
                              <div class="wdr_infoBox h-initial font_fal">
                                
                
                 </div></div>
                    <div class="wdr_bbt"><div class="wdr_title"><b>联系方式：</b>
                           <div class="wdr_line wdr_line_noBlock"><b>Q&nbsp;Q：</b><b class="ff-c-gra"><s:hidden name="designer.qq"  value="%{#request.designer.qq}"/> <s:property value="#request.designer.qq"/> </b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>微信：</b><b class="ff-c-gra"><s:hidden name="designer.wechat"  value="%{#request.designer.wechat}"/> <s:property value="#request.designer.wechat"/></b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>手机：</b><b class="ff-c-gra"><s:hidden name="designer.phone"  value="%{#request.designer.phone}"/><s:property value="#request.designer.phone"/> </b></div>
                           <div class="wdr_line wdr_line_noBlock"><b>邮箱：</b><b class="ff-c-gra"><s:hidden name="designer.email"  value="%{#request.designer.email}"/><s:property value="#request.designer.email"/> </b></div>
                     </div></div></div></div></div></div></div>
 </s:form>  
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
     </div></div>
    <script type="text/javascript">
        var msg=""+'${request.tipMessage}'; 
        if(msg!=""){ 
          alert(msg); 
      } 
     </script>
      </body></html>