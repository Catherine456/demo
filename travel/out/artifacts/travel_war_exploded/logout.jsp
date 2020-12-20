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

<table align="center">
            <s:form action="logout1" method="post">
            <tr><td  align="center">     
            <div class="layui-form-item title">
                  <label class="layui-form-label">用户ID：</label>
                       <div class="layui-input-block" >
                          <s:textfield   cssClass="layui-input"  maxlength="30" cssStyle="width:250px;"  autocomplete="off" name="userId"/>
                       </div>
               </div>
             </td>
             </tr>
                <tr> <td  align="center">     
                  <div class="layui-form-item content">
                       <label class="layui-form-label">手机号码：</label>
                         <div class="layui-input-block">
                             <s:textfield name="phone" cssClass="layui-input" theme="simple" align="center" cssStyle="width:250px;" maxlength="30" />
                          </div>
                     </div>
         </tr>
      
             <tr><td  align="center">  
           <div class="layui-form-item" margin:0 auto>
                  <div class="layui-input-block" margin:0 auto>
                    <s:submit class="layui-btn sub-form" value="注销"/>
                    </s:form>          
                  </div>
              </div>
        </tr>     
     
</table>
<script type="text/javascript">
    var col_list = '<select id="col_select"><option value="451354">笔记</option><select>';
    $(function () {
        $('.edit').deleteWorks();
        $('.edit').shareWorks();
    });
</script>
    <script src="http://img.cndesign.com/Scripts/header.js" type="text/javascript"></script>    
<div class="back">
    <i></i>
</div>
         
        </div>
    </div>
  
    <!-- footer -->
    <div class="layui-footer my-footer">
        
    </div>
</div>

<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="js/vip_comm.js"></script>
<script type="text/javascript">
layui.use(['layer','vip_nav'], function () {

    // 操作对象
    var layer       = layui.layer
        ,vipNav     = layui.vip_nav
        ,$          = layui.jquery;

    // 顶部左侧菜单生成 [请求地址,过滤ID,是否展开,携带参数]
    vipNav.top_left('./json/nav_top_left.json','side-top-left',false);
    // 主体菜单生成 [请求地址,过滤ID,是否展开,携带参数]
    vipNav.main('./json/nav_main.json','side-main',true);

    // you code ...


});


var msg=""+'${request.tipMessage}';
if(msg!=""){
    alert(msg);
}

</script>
</body>
</html>