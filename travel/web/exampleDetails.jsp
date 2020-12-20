<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>案例详情</title>
<!-- custom-theme -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Upholstery Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">


//修改了action，service，dao，example po，example映射文件，employer po,employer映射文件
function star()
{
	
	 var exampleId=document.getElementById("exampleId").value;
	 var userId=document.getElementById("userId").value;
	 if(userId=="")
	{
		 alert("登录后可以使用收藏功能！");
		 return;
	}
	
	 var path =  $('#staricon').attr('src');
	 if(path=="images/star.jpg") {
		 $.ajax({
	         type: "post",
	         data:{exampleId:exampleId, userId:userId},
	         url: "unstar",
	         beforeSend: function(XMLHttpRequest){
	         },
	         success: function(data){
	              var x="#staricon";//获取要改变的记录的图标id
	              $(x).attr("src","images/star1.png");
	          },
	         error: function(){
	         		//请求出错处理
	             alert("Error!");
	         }
	  });
	 }
	 else
	{
		 $.ajax({
	         type: "post",
	         data:{exampleId:exampleId, userId:userId},
	         url: "star",
	         beforeSend: function(XMLHttpRequest){
	         },
	         success: function(data){
	              var x="#staricon";//获取要改变的记录的图标id
	              $(x).attr("src","images/star.jpg");
	          },
	         error: function(){
	         		//请求出错处理
	             alert("Error!");
	         }
	  });
	}
	 
}


function pr(){
   // var exampleID=$('#exampleId').value;
    var exampleID=document.getElementById("exampleId").value;
    var userId=document.getElementById("userId").value;
    var path =  $('#praiseicon').attr('src');
	 if(path=="images/praise2.jpg") {
	 	alert("已经点过赞了！");
	 	return;
	 }
	if(userId=="")
	{
		 alert("登录后可以使用点赞功能！");
		 return;
	}
	$.ajax({
	           type: "post",
	           data:"exampleId="+exampleID,
	           url: "praise",
	           beforeSend: function(XMLHttpRequest){
	           },
	           success: function(data){
	        	
	                var x="#praiseicon";//获取要改变的记录的图标id
	                $(x).attr("src","images/praise2.jpg");
	               var y=document.getElementById("prnum");
	                //$(x).attr("src","value/praise2.jpg");
	               // getElementById("prnum").innerText = "这是一个P";
	                y.innerText=data; 
	            
	               
	            },
	           error: function(){
	           		//请求出错处理
	               alert("Error!");
	           }
	    });
}

function review()
{
	 var userId=document.getElementById("userId").value;
	 if(userId=="")
	{
		 alert("请先登录！");
		 return false;
	}
}
</script>
<!-- //custom-theme -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/details_style.css" rel="stylesheet" type="text/css"
	media="all" />
<!-- Le styles -->

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




</head>
<body>

<input type="hidden" id="exampleId" value="${example.exampleId}"/>
<input type="hidden" id="userId" value="<s:property value="#session.id"/>"/>
	<!-- banner -->
	<div class="banner jarallax">
		<div class="container">
			<nav class="navbar navbar-default">
			<div class="navbar-header navbar-left">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<h1>
					<a class="navbar-brand" href="index.html">室内平面设计交易平台</a>
				</h1>
			</div>
			
			
			
			
			
			
			
			
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-right"
				id="bs-example-navbar-collapse-1">
				<nav class="link-effect-8" id="link-effect-8">
				<ul class="nav navbar-nav">
					<li><a href="index.jsp">首页</a></li>
					<li class="active"><a href="findAllExample">看案例</a></li>
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


		<div class="bigtitle">
			<s:property value="#request.example.name" />
		</div>
		<div class="contain">
			<div class="leftcontain">
				<div class="detail">
					<div class="surface">
						<img src="images/s1.jpg" alt="">
					</div>
					<div class="rightdetail">
						<div class="tags">
							<div class="tag">
								<p>设计风格</p>
								<p>
									<s:property value="#request.example.style" />
								</p>
							</div>
							<div class="tag">
								<p>面积</p>
								<p>
									<s:property value="#request.example.area" />
								</p>
							</div>
							<div class="tag">
								<p>上传时间</p>
								<p>
									<s:property value="#request.example.time" />
								</p>
							</div>
						</div>

						<p>
							<s:property value="#request.example.description" />
						</p>
						<div class="icons">

							<div class="praise" id="praise" onclick="pr();">
								
									<img src="images/praise.jpg" id="praiseicon" width="25px" />
								
								<p id="prnum">
									<s:property value="#request.example.praise" />
								</p>
							</div>

						<s:if test="%{#session.employer!=null}">
						<div class="star" onclick="star()">
								<s:iterator value="#session.employer.examples_star"  end="exitId">
									<div>
										<s:if test="#request.example.exampleId == exampleId">
											<img src="images/star.jpg" id="staricon" width="25px" />
											<s:set var="exitId" value="0"></s:set>
											<s:set var="flag" value="1" scope="request"></s:set>
											
										</s:if>
									</div>
								</s:iterator>
								<s:if test="#request.flag != 1">
								
								<img src="images/star1.png" id="staricon" width="25px" />
								</s:if>
							</div>
						</s:if>
						<s:else>
							
						</s:else>
							
						</div>
						<s:iterator value="#request.example.panoramas" status="pa">
							<div class="panorama">
								<a
									href="showPanorama.action?path=<s:property value='panorama1'/>"
									target="_Blank"><input type="button" value="查看全景图"></a>
								<!-- 
								<s:form action="showPanorama" method="post" theme="simple">
									<s:hidden name="path" value="%{panorama1}" />
									<s:submit value="全景图" />
								</s:form>
								 -->
							</div>
						</s:iterator>
					</div>
				</div>

				<div class="pictures">
					<s:iterator value="#request.example.pictures">
						<div class="onepic">
							<img src="<s:property value="picture1" />" style="width: 720px" />
						</div>
					</s:iterator>
				</div>
			</div>
			<div class="rightcontain">
				<div class="designer">
					<div class="desdetail">
						<img
							src="designer/designer/profilephoto/<s:property value="#request.example.designer.profilePhoto"/>" />
						<div>
							<p>
								<s:property value="#request.example.designer.account" />
							</p>
							<p>
								点赞数:
								<s:property value="#request.example.designer.praise" />
							</p>
							<p>
								评分:
								<s:property value="#request.example.designer.score" />
							</p>
						</div>
					</div>
					<div class="visitbutton">
						<!-- <a href="visitDesigner.action?designerID=<s:property value="#request.example.designer.designerID"/>">  -->
						<a href="putDesigner.action?designer.designerId=<s:property value="#request.example.designer.designerId" />">
								<input type="button" value="访问设计师主页" />
						</a>
					</div>
				</div>
				<div class="comments">
					<s:form action="Review" method="post">
						<div class="inputtext">
							<s:hidden name="example.exampleId"
								value="%{#request.example.exampleId}" />
							<s:textarea name="comments.content" cols="25" rows="5" />
							<s:submit value="评论" onclick="return review()"/>
						</div>
					</s:form>
					<s:iterator value="#request.displayComs">
						<div class="existcomment">
							<div class="giver">
								<s:if test="%{#session.employer!=null}">
								<img src="/designer/employer/profilephoto/<s:property value="profilePhoto"/>">
								</s:if>
								<s:if test="%{#session.designer!=null}">
								<img src="designer/designer/profilephoto/<s:property value="profilePhoto"/>">
								</s:if>
								<div>
									<p>
										<s:property value="account" />
									</p>
									<p>
										<s:property value="time" />
									</p>
								</div>
							</div>
							<div class="content">
								<s:property value="content" />
							</div>
						</div>
					</s:iterator>
				</div>
				
				<div class="recommend">
					 <div class="title" >--猜你喜欢--</div>
    
		
			 <s:if test="%{#session.employer!=null}" >
			<s:iterator value="#session.recommendExamples">
					<div class="item">
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
							<div>
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
		</div>

	</div>
</body>
</html>