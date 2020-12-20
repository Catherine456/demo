 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>设计师个人中心</title>
<link rel="stylesheet" type="text/css"  href="layui/css/layui.css" media="all">
<link rel="stylesheet" type="text/css"  href="css/DIndexstyle.css">
</head>
<body>

<div class="layui-layout layui-layout-admin"> 
 
    <div class="layui-header my-header">
            <div class="my-header-logo">设计师个人中心</div>
            <div class="my-header-btn">
            <button class="layui-btn layui-btn-small btn-nav"><i class="layui-icon">&#xe65f;</i></button>
        </div>
        <!-- 顶部右侧添加选项卡监听 -->
        <ul class="layui-nav my-header-user-nav" lay-filter="side-top-right">
            <li class="layui-nav-item">
                <a class="name" href="javascript:;"><i class="layui-icon">&#xe647;</i><span class="layui-nav-more"></span></a>
                <dl class="layui-nav-child">
                    <dd><a href="index.jsp"><i class="layui-icon">&#xe621;</i>首页</a></dd>
                    <dd><a href="logout.action"><i class="layui-icon">&#x1006;</i>退出</a></dd>
                </dl>
            </li>
        </ul>

    </div>
    <!-- side -->
    <div class="layui-side my-side">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="side-main">
               <li class="layui-nav-item  layui-nav-itemed">
                    <a href="javascript:;"><i class="layui-icon">&#xe612;</i>我的账号
                    <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" href-url="Dpersonal.jsp"><i class="layui-icon">&#xe621;</i>个人资料</a></dd>
                        <dd><a href="javascript:;" href-url="Dcertificate.jsp"><i class="layui-icon">&#xe621;</i>设计师认证</a></dd>
                        <dd><a href="javascript:;" href-url="recommend.jsp"><i class="layui-icon">&#xe621;</i>申请推优</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="layui-icon">&#xe62d;</i>交易管理
                    <span class="layui-nav-more"></span>
                    </a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" href-url="SubcribeList.jsp"><i class="layui-icon">&#xe621;</i>我收到的预约</a></dd>
                        <dd><a href="javascript:;" href-url="OrderrList.jsp"><i class="layui-icon">&#xe621;</i>我的签单项目</a></dd>
                    </dl>
                </li>
            </ul>

        </div>
    </div>
    <!-- body -->
    <div class="layui-body my-body">
        <div class="layui-tab layui-tab-card my-tab" lay-filter="card" lay-allowClose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" lay-id="1"><span><i class="layui-icon">&#xe638;</i>欢迎页</span></li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show">
                    <iframe id="iframe" src="Welcome.jsp" frameborder="0"></iframe>
                </div>
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
</script>
</body>
</html>