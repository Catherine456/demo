<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<html>
<head>
    <s:head theme="xhtml"/>
    <sx:head parseContent="true" extraLocales="UTF-8"/>
    <link rel="stylesheet" href="css/layui.css">
    <link rel="stylesheet" href="css/base.css">
    <link rel="stylesheet" href="css/postDemand.css">
    <link rel="stylesheet" href="css/modals.css">
    <link rel="stylesheet" href="css/message.css">
</head>
<body>
<div class="contain_fluid header">
    <div class="contain_box clear">
        <span>专业小户型家装平台</span>
    </div></div>
<div class="contain_fluid nav_bar">
    <div class="contain_box clear">
        <ul class="fl clear"><li class="fl"><a href="/">首页</a></li>
            <li class="fl"><a href="/Designers/List">找设计师</a></li>
            <li class="fl"><a href="/Requirements/List">找需求</a></li>
            <li class="fl"><a href="/Works/List">看案例</a></li></ul>

    </div></div>

<div class="contain_box main"><div class="title_box"><h4>免费发布需求，挑选高效的设计服务</h4></div>
    <div class="schedule">
        <ul class="clear">
            <li class="fl"><i class="icon icon-time-node icon-next">1</i>
                <span>发布需求</span></li>
            <li class="fl"><i class="icon icon-time-node icon-next">2</i>
                <span>设计师报名</span></li>
            <li class="fl"><i class="icon icon-time-node icon-next">3</i>
                <span>挑选设计师</span></li>
            <li class="fl"><i class="icon icon-time-node icon-next">4</i>
                <span>托管资金</span></li>
            <li class="fl"><i class="icon icon-time-node icon-next">5</i>
                <span>设计师设计</span></li>
            <li class="fl"><i class="icon icon-time-node icon-next">6</i>
                <span>验收付款</span></li></ul></div>

    <div class="main_box clear"><div class="main_left fl"><h4>为了尽快能够帮您完成需求，请尽可能详细的描述您的需求！
        <a href="./findneeds">逛需求大厅看看别人怎么写</a></h4>
        <s:property value="#request.tip"/>
        <div class="layui-form" id="postRequestForm">
            <s:form action="order" method="post">
            <div class="layui-form-item title">
                <label class="layui-form-label">
                    <i class="red">*</i>选择需求风格：</label>
                <div class="layui-input-block">
                    <s:textfield  name="need.style" cssClass="layui-input"  maxlength="10" placeholder="请输入风格(地中海、简约、清新...)" autocomplete="off"/>
                    <span class="tip hide">
     <i class="icon icon-warning"></i>请选择需求类型</span></div></div>

            <div class="layui-form-item title">
                <label class="layui-form-label">
                    <i class="red">*</i>填写需求标题：</label>
                <div class="layui-input-block">
                    <s:textfield   cssClass="layui-input"  maxlength="50" placeholder="请输入标题" autocomplete="off" name="need.title"/>
                    <span class="tip hide"><i class="icon icon-warning"></i>请输入需求标题（不能超过50个字符）</span></div></div>

            <div class="layui-form-item content">
                <label class="layui-form-label"><i class="red">*</i>填写需求描述：</label>
                <div class="layui-input-block">
                    <s:textarea name="need.description" cssClass="layui-textarea"   maxlength="4000" placeholder="请输入需求描述"/>
                    <span class="tip hide"><i class="icon icon-warning"></i>需求描述字符不得少于10个字符,最多4000字符</span></div></div>

            <div class="layui-form-item designEndTime">
                <label class="layui-form-label">
                    <i class="red">*</i>填写需求城市：</label>
                <div class="layui-input-block">
                    <s:textfield   cssClass="layui-input"  placeholder="请输入所在地"  name="need.city"/>
                    <span class="tip hide"><i class="icon icon-warning"></i>请输入需求所在地</span></div></div>

            <div class="layui-form-item area">
                <label class="layui-form-label"><i class="red">*</i>需求面积：</label>
                <div class="layui-input-block">
                    <s:textfield name="need.area" cssClass="layui-input" theme="simple"  cssStyle="width:120px;" maxlength="7"/><span>平方米</span>
                    <span class="tip hide"><i class="icon icon-warning"></i>请输入需求面积</span></div></div>

            <div class="layui-form-item date_zone">
                <label class="layui-form-label"><i class="red">*</i>报名截止时间：</label>
                <div class="layui-input-block">
                    <sx:datetimepicker name="need.time2" displayFormat="yyyy-MM-dd"   cssClass="layui-input"/>
                    <span class="tip hide"><i class="icon icon-warning"></i>必须选择报名截止时间</span></div></div>

            <div class="layui-form-item budget">
                <label class="layui-form-label"><i class="red">*</i>预算金额：</label>
                <div class="layui-input-block">
                    <s:textfield name="need.money" cssClass="layui-input fl"  maxlength="7" lay-verify="required|money"/><span>元</span>
                    <span class="tip hide"><i class="icon icon-warning"></i>请输入预算金额</span></div></div>


            <div class="layui-form-item designEndTime">
                <label class="layui-form-label"><i class="red">*</i>设计完成日期：</label>
                <div class="layui-input-block">
                    <sx:datetimepicker name="need.time3" displayFormat="yyyy-MM-dd"   cssClass="layui-input"/>
                </div></div>

            <div class="layui-form-item"><div class="layui-input-block">
                <s:submit class="layui-btn sub-form" value="立即发布"/>
                </s:form>
            </div></div></div></div>


        <div class="v_line fl"></div>
        <div class="main_right fr">
            <h6 class="title">如不清楚怎么填写你的需求，请参照模板填写！</h6>
            <h6>1、需求风格</h6><p>风格可以根据自己的喜好选择，如不确定，请选择其他；</p>
            <h6>2、需求标题</h6><p>标题尽量用简单、明了的语言来描述自己的需求。如：地中海小户设计；</p>
            <h6>3、需求描述</h6><p>好的需求描述，能够让设计师更容易理解您，尽快的帮您完成需求；</p>
            <h6 style="font-size: 14px;margin-top: 0;">您可要参考下列描述，根据自己的需求选择填写：</h6>
            <p>(1).设计对象介绍：如某某小区......</p>
            <p>(2).设计风格：如简洁、小清新、要有亲和力......</p>
            <p>(3).设计色调：如蓝色、红色、黄色......</p>
            <p>(4).房屋大小：如120m2</p>
            <p>(5).设计具体要求：如对卧室、厨房等的具体要求......</p>
            <h6>4、需求所在地</h6><p>设计房屋所在城市</p>
            <h6>5、需求面积</h6><p>设计房子的面积</p>
            <h6>6、报名截止时间</h6><p>报名截止时间后不允许再报名</p>
            <h6>7、预算金额</h6><p>支付给设计师金额。预算后期无法修改。为了减少沟通，增大报名率，建议根据自己的预算填写</p>
            <h6>8、设计截止时间</h6><p>期望设计交付的时间</p>
        </div></div></div>


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
    <script type="text/javascript" charset="GB2312">
        var msg=""+'${request.tip}';
        if(msg!=""){
            alert(msg);
        }
    </script>
</body></html>