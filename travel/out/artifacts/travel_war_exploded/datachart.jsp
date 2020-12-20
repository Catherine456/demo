<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="css/flexslider.css" type="text/css"
	media="screen" property="" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- //js -->
<!-- font-awesome-icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome-icons -->
<link
	href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">
<meta charset="UTF-8">
<script src="js/echarts.js"></script>
<style>
.count
{
font-size: 30px;

text-align: center;
}

.title
{text-align: center;}

.fangweng
{display: inline-block;

padding: 20px;

margin: 10px;}

.num
{display: inline-block;}

.banner
{margin-bottom: 20px;}
.all
{background: #f3f1dc;}

</style>
<script type="text/javascript">

window.onload=function(){
	

	var fangweng = echarts.init(document.getElementById('fangweng'));
	var num = echarts.init(document.getElementById('num'));
	var values=new Array(5);
	var examples = new Array(5);
	var orders = new Array(5);
	
	<s:iterator value="#request.datalist" status="s">
		values[<s:property value="#s.index" />] = <s:property value="visit"/>
		examples[<s:property value="#s.index" />] = <s:property value="examplenum"/>
		orders[<s:property value="#s.index" />] = <s:property value="ordernum"/>
	</s:iterator>

	var option = {
			 title: {
			        text: '日访问量记录表'
			   },
		    xAxis: {
		        type: 'category',
		        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: [5, values[0], values[1], values[2], values[3],values[4]],
		        type: 'line'
		    }]
	};
	fangweng.setOption(option);
	var option2 = {
		    title: {
		        text: '综合数据变化记录表'
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross',
		            label: {
		                backgroundColor: '#6a7985'
		            }
		        }
		    },
		    legend: {
		        data:['设计师注册数','普通用户注册数','上传案例数量','订单生成量']
		    },
		    toolbox: {
		        feature: {
		            saveAsImage: {}
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : ['周一','周二','周三','周四','周五','周六','周日']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'设计师注册数',
		            type:'line',
		            stack: '总量',
		            areaStyle: {},
		            data:[2, 1, 3, 2, 5, 1, 4]
		        },
		        {
		            name:'普通用户注册数',
		            type:'line',
		            stack: '总量',
		            areaStyle: {},
		            data:[3, 4, 3, 2, 1, 3, 1]
		        },
		        {
		            name:'上传案例数量',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:[1, 2, examples[0], examples[1], examples[2], examples[3], examples[4]]
		        },
		        {
		            name:'订单生成量',
		            type:'line',
		            stack: '总量',
		            label: {
		                normal: {
		                    show: true,
		                    position: 'top'
		                }
		            },
		            areaStyle: {normal: {}},
		            data:[1, 2, orders[0], orders[1], orders[2], orders[3], orders[4]]
		        }
		    ]
		};

	num.setOption(option2);
	
	
};



</script>
<title>Insert title here</title>
</head>
<body>
<div class="all">
<div class="banner stats jarallax">
		<div class="container">
			<h3 class="w3ls_head">
				<span class="thr">统计 </span>数据
			</h3>
			
			<div class="stat_top">
				<div class="col-md-3 w3layouts_stats_left w3_counter_grid">
					
					<h3 class="title">案例总数</h3>
					<p class="count">19</p>

				</div>
				<div class="col-md-3 w3layouts_stats_left w3_counter_grid1">
					
					<h3 class="title">注册设计师</h3>
					<p class="count">8</p>

				</div>
				<div class="col-md-3 w3layouts_stats_left w3_counter_grid2">
					
					<h3 class="title">注册用户</h3>
					<p class="count">16</p>

				</div>
				<div class="col-md-3 w3layouts_stats_left w3_counter_grid3">
					
					<h3 class="title">订单数</h3>
					<p class="count">22</p>

				</div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
	<!-- //stats -->
<div class="fangweng" id="fangweng" style="width: 600px;height:400px;"></div>
<div class="num" id="num" style="width: 600px;height:400px;"></div>
<div id="main" style="width: 600px;height:400px;"></div>
<div id="main" style="width: 600px;height:400px;"></div>
</div>
</body>
</html>