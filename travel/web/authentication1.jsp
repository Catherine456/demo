 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ page import="cn.edu.zjut.po.Designer" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员个人中心</title>
<link rel="stylesheet" type="text/css"  href="layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"  href="css/DIndexstyle.css">
 <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/modals.css">
    <link rel="stylesheet" href="css/message.css">
    <link rel="stylesheet" href="css/requirements1.css">
</head>
<body>

    <!-- body -->
  
  <div class="thead clear">
  <span class="col_01 thead_title">设计师编号</span>
  <span class="col_02 thead_startTime">姓名</span>
  <span class="col_03 thead_endTime">身份证号码</span>
  <span class="col_04 thead_sort">手机号码</span>
  <span class="col_05 thead_status"></span>
  </div>
<%
Designer designer;
List list=(List)session.getAttribute("designerss");
int bpage=0;
if(request.getParameter("page")==null){
    	bpage=1;
 }
else{
    bpage=Integer.parseInt(request.getParameter("page"));
}
int k=list.size();
if(list!=null){
	  int a=(bpage-1)*5;
	  int b=bpage*5;
	  if(k-a<b){
		  b=k;
	  }else{
		  k=k-5;
	  }
       for(int j=a;j<b && j<30;j++){
    	   designer=(Designer)list.get(j);
    	   request.setAttribute("designer",designer);
%>

<div class="main_requirements">
<ul class="list_contain">
   <li class="clear list">
   <div class="col_01 fl req_title">
   <h4>
   <b>${designer.designerId}</b>
    </h4>
    </div>
<div class="col_02 fl req_startTime"><span>${designer.name}</span></div>
<div class="col_03 fl req_endTime"><span style="font-weight: 400;">${designer.IDNumber}</span></div>
<div class="col_04 fl req_sort"><span>${designer.phone}</span></div>
<div class="col_04 fl req_status"><a href="view.action?designer.designerId=${designer.designerId}">查看详情</a></div>
   </li>
   </ul>
</div>
<%
	       }
	       
%>
</div>
<div class="contain_fluid contain_box">
<div class="paging_box">
<ul class="paging_ul">
<li class="paging_lists">
<a class="paging_a paging_bg"  href=authentication1.jsp?page=<%=bpage-1%>>
<div class="triangle_left"></div></a></li>
<li class="paging_lists">
<a class="paging_a paging_a_selected" href=authentication1.jsp?page=<%=bpage%>><%=bpage %></a></li>
<li class="paging_lists"><a class="paging_a paging_bg"  href=authentication1.jsp?page=<%=bpage+1%>>
<div class="triangle_right"></div>
</a>
</li>
</ul>
</div>
</div>
<% 
	       }
%> 
</div>
<script type="text/javascript">
    var col_list = '<select id="col_select"><option value="451354">笔记</option><select>';
    $(function () {
        $('.edit').deleteWorks();
        $('.edit').shareWorks();
    });
</script>
       </div>
    </div>
    <script src="http://img.cndesign.com/Scripts/header.js" type="text/javascript"></script>    
<div class="back">
    <i></i>
</div>

</body>
</html>