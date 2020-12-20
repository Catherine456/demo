<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.internal.util.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="cn.edu.zjut.dao.*"%>
<%@ page import="cn.edu.zjut.po.*"%>
<%@ page import="org.springframework.context.ApplicationContext"%>
<%@ page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<meta charset="UTF-8">
<title>支付成功</title>
<style>
.content
{
	text-align:center;
	margin-top: 100px;
}

.content a
{
	display:block;
}


</style>
<link type="text/css" rel="stylesheet" href="css/common.css" />
 <link href="css/bootstrap3.css" rel="stylesheet">
    <link href="css/bootstrap-responsive3.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- Extra Styles, not needed for Mega Menu or Boostrap -->
	<link href="css/style3.css" rel="stylesheet">
	<link rel="stylesheet" href="layui/css/layui.css">
	<!-- Mega Menu Style, you kinda really need Bootstrap in order for this to work -->
	<link href="css/mega-menu3.css" rel="stylesheet">
</head>


<body>


<%
/* *
 * 功能：支付宝服务器同步通知页面
 * 日期：2017-03-30
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。


 *************************页面功能说明*************************
 * 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
 */
 
	//获取支付宝GET过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map<String,String[]> requestParams = request.getParameterMap();
	for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

	//——请在这里编写您的程序（以下代码仅作参考）——
	if(signVerified) {
		//商户订单号
		String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//支付宝交易号
		String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
	
		//付款金额
		String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
		
		//交易状态
		//String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
		out.println("ok");
		out.println("trade_no:"+trade_no+"<br/>out_trade_no:"+out_trade_no+"<br/>total_amount:"+total_amount);
		
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//设置请求参数
		AlipayTradeQueryRequest alipayRequest = new AlipayTradeQueryRequest();
		
		alipayRequest.setBizContent("{\"out_trade_no\":\""+out_trade_no+"\"}");
		
		//请求
		String result = alipayClient.execute(alipayRequest).getTradeStatus();
		ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
		if(result.equals("TRADE_SUCCESS"))
		{
			try{
				IOrderrDAO orderrDAO=(IOrderrDAO)ctx.getBean("orderrDAO");
		        Orderr order=orderrDAO.findById(out_trade_no);
		        order.setState("已付款");
		        orderrDAO.update(order);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}else {
		out.println("验签失败");
	}
	//——请在这里编写您的程序（以上代码仅作参考）——
%> 

<header class="container" >
	

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					</a>
					
						<div class="nav-collapse collapse">
							<ul class="nav">
								<li><a href="back2.action">首页</a></li>
							<li><a href="back.action">返回</a></li>
						  
						  
						
							</ul>
						</div><!--/.nav-collapse -->
				</div><!-- Container -->
			</div><!-- Nav Bar - Inner -->
		</div><!-- Nav Bar -->
	

<div class="content">
<img src="images/paysuccess.jpg">
</div>
</body>
</html>