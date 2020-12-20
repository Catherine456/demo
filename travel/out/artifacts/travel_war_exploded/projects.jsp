<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<!--
author: W3layouts
author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html lang="en">
<head>
<s:head theme="xhtml" />
<sx:head parseContent="true" extraLocales="UTF-8" />
<title>装修案例</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Upholstery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
</script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet" href="css/lsb.css">
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>


<link rel="stylesheet" type="text/css" href="style/list.css" />

<script type="text/javascript">
	$(document).ready(function() {
		var tab = new $.fn.tab({
			tabList : "#demo1 .ui-tab-container .ui-tab-list li",
			contentList : "#demo1 .ui-tab-container .ui-tab-content"
		});
		var tab = new $.fn.tab({
			tabList : "#demo1 .ui-tab-container .ui-tab-list2 li",
			contentList : "#demo1 .ui-tab-container .ui-tab-content2"
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e) {
		$("#selectList").find(".more").toggle(function() {
			$(this).addClass("more_bg");
			$(".more-none").show()
		}, function() {
			$(this).removeClass("more_bg");
			$(".more-none").hide()
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		var taboy_box = $(".lefttable-list");
		taboy_box.children("tbody").find("tr:gt(2)").hide();
		$(".leftbox-morea").toggle(function() {
			$(this).parent().prev().find("tr").show();
			$(this).addClass("more-i")
		}, function() {
			$(this).removeClass("more-i");
			$(this).parent().prev().children("tbody").find("tr:gt(2)").hide();
		});
	});
</script>
<!-- //js -->


<script type="text/javascript" src="js/jquery-form.js"></script>


<!-- font-awesome-icons -->
<link rel="stylesheet" href="css/font-awesome.min.css" />
<!-- //font-awesome-icons -->
<link
	href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
	rel="stylesheet">
	
	
	
	
	
	
 <style>
        .Box{
       padding-top: 20px;

padding-right: 50px;

padding-bottom: 50px;

padding-left: 50px;

background: #cac3b2;
        }
        .con{
           
            margin-top:10px;
            display:none;
        }
        .current{
           background-color: #bc7f5f;
    height: 35px;
    border: 1px solid #929292;
    margin: -5px;
    width: ;
    font-size: 20px;
    color: white;
    padding: 2px 10px 2px 10px;
}
        
        .normal{
       background-color: #fff;
  height: 35px;
    border: 1px solid #929292;
    margin: -5px;
    width: ;
    font-size: 20px;
    color: #bc7f5f;
    padding: 2px 10px 2px 10px;
        }
        
        
       .temp
       {width: 100px;

height: 80px;

display: inline;

color: #cac3b2;
       }
       
    </style>
	
	
	
	
	
	
	
	
	
	
	
</head>

<body>
	<!-- banner -->
	<div class="banner1 jarallax">
		<div class="container">
			<nav class="navbar navbar-default"
				style="background: #7c6f63; padding: 10px;">
				<div class="navbar-header navbar-left">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>

				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				
				
				
				
				<div class="collapse navbar-collapse navbar-right"
					id="bs-example-navbar-collapse-1">
					<nav class="link-effect-8" id="link-effect-8">
						<ul class="nav navbar-nav">
							<li><a href="index.jsp">主页</a></li>
							<li class="active"><a href="projects.jsp">看案例</a></li>
							<li><a href="findneeds">找需求</a></li>
							<li><a href="selectDesigner.jsp">查找设计师</a></li>
							<s:if test="%{#session.id==null}">
							<li><a href="login.jsp">登录</a></li>
							<li><a href="contact.html">注册</a></li>
						</s:if>
						<s:else>
                      <s:if test="%{#session.designer!=null}">
						  <li><a href="judge.action" target="_Blank">个人主页</a>
							</li>
							<li><a href="designerIndex.jsp">个人中心</a></li>
						  </s:if>
						  <s:elseif test="%{#session.employer!=null}">
						    <li><a href="judge.action" target="_Blank">个人主页</a>
							</li>
							<li><a href="employerIndex.jsp">个人中心</a></li>
						  </s:elseif>
						   <s:elseif test="%{#session.admin!=null}">
						 
							<li><a href="authentication.jsp">个人中心</a></li>
						  </s:elseif>
						</s:else>
						</ul>
					</nav>
				</div>
			</nav>
		</div>

		<div class="searchframe">
			<!-- searchInFrame -->
			<form action="searchInFrame" method="post">
				<input class="searchtext" type="text" name="condition"
					placeholder="输入搜索条件" required=""> <input
					class="searchbutton" type="submit" value="搜索">
			</form>
		</div>

		<div class="subnav">

			<div id="selectList" class="screenBox screenBackground">
				<form action="searchInList" id="list_form">
					<div class="oneline">
						<dl attr="terminal_os_s">
							<dt class="lefttitle">
								<p>风格</p>
							</dt>
							<dd>
								<div class="righttitle">
									<label><input name="radio2" type="radio" value="简约"
										autocomplete="off" /> <a href="javascript:;">简约</a></label> <label><input
										name="radio2" type="radio" value="地中海" autocomplete="off" /> <a
										href="javascript:;">地中海</a></label>
								</div>
							</dd>
						</dl>
					</div>
					<div class="oneline">
						<dl attr="terminal_os_s">
							<dt class="lefttitle">
								<p>户型</p>
							</dt>
							<dd>
								<div class="righttitle">

									<label><input name="radio1" type="radio" value="小户型"
										autocomplete="off" /> <a href="javascript:;">小户型</a></label> <label><input
										name="radio1" type="radio" value="一居室" autocomplete="off" /> <a
										href="javascript:;">一居室</a></label>
								</div>
							</dd>
						</dl>
					</div>
					<div class="oneline">
						<dl attr="terminal_os_s">
							<dt class="lefttitle">
								<p>面积</p>
							</dt>
							<dd>
								<div class="righttitle">

									<label><input name="radio3" type="radio" value="100m2"
										autocomplete="off" /> <a href="javascript:;">100m2</a></label> <label><input
										name="radio3" type="radio" value="120m2" autocomplete="off" />
										<a href="javascript:;">120m2</a></label>
								</div>
							</dd>
						</dl>
					</div>

				</form>
			</div>
			<div class="resultList">
				<div class="oneline" style="border-bottom: 0px;">
					<div>
						<dl class="selected clearfix">
							<dt class="lefttitle">
								<p>已选条件</p>
							</dt>
							<!--  clearDd    显示位置 -->
							<dd style="DISPLAY: none" class=clearDd>

								<div id="clearList" class="clearList righttitle"></div>
							</dd>
						</dl>

					</div>
					<div style="float: right;" class="eliminateCriteria">【清空全部】</div>
				</div>
			</div>


			<script type="text/javascript" src="js/shaixuan.js"></script>
		</div>
	</div>










<div class="Box" id="box">
	<div class="temp" >HHH</div>
    <button name="butt" class="current" >综合排序</button>
    <button class="normal" name="butt">猜你喜欢</button>
  
    <div name="di" class="con" style="display:block">
    
	<!-- projects -->
	<div class="waterfall">
		<div class="results" id="results">
			<s:if test="#request.examples.size()!=0">
				<s:iterator value="#request.examples">
					<div class="resultitem">
						<a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
							<s:iterator value="pictures" status="st">
								<s:if test="%{#st.first==true}">
									<img src="<s:property value="picture1"/>" />
								</s:if>
								<s:else>
									<img style="display: none; border: 0px;"
										src="<s:property value="picture1"/>" />
								</s:else>
							</s:iterator>
							<div class="description">
								<h4>
									<s:property value="name" />
								</h4>
							</div>
						</a>
					</div>
				</s:iterator>
			</s:if>
			<s:else>
				<h1>没有找到哦</h1>
			</s:else>
		</div>
	</div>
	<!-- //projects -->
    
    
    </div>
    <div name="di" class="con">
    
    
    
    
    <div class="waterfall">
		
			 <s:if test="%{#session.employer!=null}" >
			<s:iterator value="#session.recommendExamples">
					<div class="resultitem">
						<a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
							<s:iterator value="pictures" status="st">
										<s:if test="%{#st.first==true}">
											<img src="<s:property value="picture1"/>" />
										</s:if>
										<s:else>
											<img style="display: none; border: 0px;"
												src="<s:property value="picture1"/>" />
										</s:else>
									</s:iterator>
							<div class="description">
								<h4>
									<s:property value="name" />
								</h4>
							</div>
						</a>
					</div>
				</s:iterator>
			</s:if>
			<s:else>
			</s:else>
		
	</div>

    </div>
    <div  name="di" class="con">
    
	<!-- projects -->
	<div class="waterfall">
		<div class="results" id="results">
			<s:if test="#request.sortedexamples.size()!=0">
				<s:iterator value="#request.sortedexamples">
					<div class="resultitem">
						<a href="putExample.action?example.exampleId=<s:property value='exampleId'/>">
							<s:iterator value="pictures" status="st">
								<s:if test="%{#st.first==true}">
									<img src="<s:property value="picture1"/>" />
								</s:if>
								<s:else>
									<img style="display: none; border: 0px;"
										src="<s:property value="picture1"/>" />
								</s:else>
							</s:iterator>
							<div class="description">
								<h4>
									<s:property value="name" />
								</h4>
							</div>
						</a>
					</div>
				</s:iterator>
			</s:if>
			<s:else>
				<h1>没有找到哦</h1>
			</s:else>
		</div>
	</div>
	<!-- //projects -->
    
    
    
    </div>
</div>
<script>

    // 首先要获得所有的按钮
    var box = document.getElementById('box');
    var btns = document.getElementsByName('butt');
    var divs = document.getElementsByName('di');
    for(var i=0;i<btns.length;i++){
        var btn = btns[i];
        btn.index = i;// 给每个按钮添加一个自定义属性，用来存储当前的索引
        btn.onclick = function(){

            for(var j=0;j<btns.length;j++){
                btns[j].className = 'normal';
            }
            this.className = 'current';
            for(var k = 0;k<divs.length;k++){
                divs[k].style.display = 'none';
            }
            divs[this.index].style.display = 'block';
        }
    }
</script>



	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="w3_agile_footer_grids">
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Latest Tweets</h3>
					<ul class="agile_footer_grid_list">
						<li><i class="fa fa-twitter" aria-hidden="true"></i>Nam
							libero tempore, cum soluta nobis est eligendi optio cumque nihil
							impedit. <span>1 day ago</span></li>
						<li><i class="fa fa-twitter" aria-hidden="true"></i>Itaque
							earum rerum hic tenetur a sapiente delectus <a
							href="mailto:info@mail.com">info@mail.com</a> cumque nihil
							impedit. <span>2 days ago</span></li>
					</ul>
				</div>
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Navigation</h3>
					<ul class="agileits_w3layouts_footer_grid_list">
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
							href="index.html">Home</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
							href="services.html">Services</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
							href="projects.html">Projects</a></li>
						<li><i class="fa fa-angle-double-right" aria-hidden="true"></i><a
							href="contact.html">Contact</a></li>
					</ul>
				</div>
				<div class="col-md-4 w3_agile_footer_grid">
					<h3>Latest Works</h3>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s6.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s2.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s1.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s3.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s4.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="w3_agileits_footer_grid_left">
						<a href="#"><img src="images/s5.jpg" alt=" "
							class="img-responsive" /></a>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class="clearfix"></div>
			</div>


			<div class="agileinfo_copyright">
				<p>
					© 2018 Upholstery. All Rights Reserved | Design by <a
						href="https://w3layouts.com/">W3layouts</a>
				</p>
			</div>
		</div>
	</div>
	<!-- //footer -->
	<script type="text/javascript" src="js/move-top.js"></script>
	<script type="text/javascript" src="js/easing.js"></script>
	<!-- here stars scrolling icon -->
	<script type="text/javascript">
		$(document).ready(function() {
			/*
				var defaults = {
				containerID: 'toTop', // fading element id
				containerHoverID: 'toTopHover', // fading element hover id
				scrollSpeed: 1200,
				easingType: 'linear' 
				};
			 */

			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<!-- //here ends scrolling icon -->
	<!-- for bootstrap working -->
	<script src="js/bootstrap.js"></script>
	<!-- //for bootstrap working -->
	<script src="js/jarallax.js"></script>
	<script src="js/SmoothScroll.min.js"></script>
	<script type="text/javascript">
		/* init Jarallax */
		$('.jarallax').jarallax({
			speed : 0.5,
			imgWidth : 1366,
			imgHeight : 768
		})
	</script>
	<!-- lightspeedBox -->
	<script src="js/lsb.js"></script>
	<!-- //lightspeedBox -->

</body>
</html>