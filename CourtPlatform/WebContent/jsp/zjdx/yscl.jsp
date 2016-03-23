<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/global.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app/common.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/app/business.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/cp_common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/app/common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/app/business.js"></script>
	
<!-- 时间轴 -->

<link href='https://fonts.useso.com/css?family=Playfair+Display:700,900|Fira+Sans:400,400italic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/timeline/css/reset.css"> <!-- CSS reset -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/timeline/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/timeline/css/style.css"> <!-- Resource style -->

<script src="${pageContext.request.contextPath}/lib/timeline/js/modernizr.js"></script> <!-- Modernizr -->
<script src="${pageContext.request.contextPath}/lib/timeline/js/jquery.mobile.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/lib/timeline/js/main.js"></script>
<style type="text/css">
	.icon-container{
	padding-top:120px;
	margin-bottom:6em;
	}
</style>
<title>院史陈列</title>
</head>
<body>
<div class="back" style="width:500px;height:100px;float:left">
	<a href="${pageContext.request.contextPath}/index" style="width:500px;height:100px;display: inline-block"></a>
</div>
<div class="icon-container">
<section class="cd-horizontal-timeline">
<div class="timeline">
<div class="events-wrapper">
	<div class="events" style="width:${(historys.size())*125+100}px">
		<ol>
 		<c:forEach items="${historys}" var="his" varStatus="status"> 
			<li><a style="left:${(status.index+1)*120}px" href="#0" data-date="${his.time}" <c:if test="${status.index == 0}">class="selected"</c:if>>${his.time}</a></li>
		</c:forEach>
			<!-- <li><a href="#0" data-date="28/01/2014" class="selected">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="20/04/2014">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="20/05/2014">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="09/07/2014">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="30/08/2014">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="15/09/2014">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="01/11/2014">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="10/12/2014">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="19/01/2015">1992年<br>10月12日</a></li>
			<li><a href="#0" data-date="03/03/2015">1992年<br>10月12日</a></li> -->
		</ol>

		<span class="filling-line" aria-hidden="true"></span>
			</div> <!-- .events -->
		</div> <!-- .events-wrapper -->
			
		<ul class="cd-timeline-navigation">
			<li><a href="#0" class="prev inactive">Prev</a></li>
			<li><a href="#0" class="next">Next</a></li>
		</ul> <!-- .cd-timeline-navigation -->
	</div> <!-- .timeline -->

	<div class="events-content">
		<ol>
		<c:forEach items="${historys}" var="his" varStatus="status"> 
			<li <c:if test="${status.index == 0}">class="selected"</c:if> data-date="${his.time}">
			<div style="float:left;width:50%">
				<h2>${his.title}</h2>
				<em>${his.time}</em>
				<p>	
					${his.content}
				</p>
			</div>
				<img src="${pageContext.request.contextPath}/images/history/${his.c_img}" 
				style="float:left;width:375px;margin-bottom:30px"/>
			</li>
		</c:forEach>
		</ol>
	</div> <!-- .events-content -->
</section>
</div><!-- /icon-container -->






<div class="left-arrow" onclick="scroll_left()">
		<img src="${pageContext.request.contextPath}/images/arrow_left.png" />
	</div>
	<div class="btn-bar">
	
		<div class="btn-wrapper">
			<div class="index-btn unhovered" onclick="fold_models()">
				<div class="text">${menuContext.currentModel.name}</div>
			</div>
			<div class="index-btn-shadow"></div>
		</div>
		<div class="sbtns">
			<c:forEach items="${menuContext.subModels}" var="subModel" varStatus="status"> 
			<c:if test="${status.index%sessionScope.per_page == 0}">
				<div class="sbtn-group" data-page="${status.index/sessionScope.per_page}">
			</c:if>
			<div class="sbtn-wrapper">
				<div class="sbtn unhovered" onclick="show_sub_system('${subModel.c_url}',this)">
					<div class="text">${subModel.name}</div>
				</div>
				<div class="sbtn-shadow"></div>
			</div>
			<c:if test="${status.index%sessionScope.per_page == sessionScope.per_page-1}">
				</div>
			</c:if>
			</c:forEach>
		</div>
		
	</div>
	<div class="right-arrow" onclick="scroll_right()">
		<img src="${pageContext.request.contextPath}/images/arrow_right.png" />
	</div>
	<div class="board">
		<img src="${pageContext.request.contextPath}/images/board.png" />
	</div>
	<script type="text/javascript">
	var award_ptr = 0;
	function show_sub_system(url,e){
		$(".active").attr("class","sbtn unhovered");
		$(e).attr("class",$(e).attr("class")+" active");
		$.ajax({url:"${pageContext.request.contextPath}/zjdx"+"/business",data:{"url":url},type:"post",dataType:"json",async:false,success:function(data){
			/* $(".icon-container").empty();
			$(".icon-container").append(data); */
			$(".icon-line").remove();
			$(".icon-container").empty();
			var line;
			var models = data.modelMap.menuContext.subModels;
			for(var o in models){  
				if(o%6 == 0){
					 line = document.createElement("div");
					 $(line).attr("class","icon-line") ;
					 $(".icon-container").empty();
					 $(".icon-container").append(line);
				}
				$(line).append("<div class=\"icon\" id=\""+models[o].c_url+"\"\><img src=\"${pageContext.request.contextPath}/images/icon/"+models[o].c_img+"\"/></div>");
				$(".icon").click(function(){
					window.location.href="${pageContext.request.contextPath}/"+$(this).attr('id');
				});
			}
		}});
	}
	$(function(){
		
	});
	var MODEL_COUNT = ${menuContext.subModels.size()};
	var PER_PAGE = ${sessionScope.per_page};
	var page_count = MODEL_COUNT%PER_PAGE == 0 ? MODEL_COUNT/PER_PAGE : (MODEL_COUNT/PER_PAGE+1);
	var cur_page = 0;
	$(".sbtn-group").css("width",200*PER_PAGE+"px");
	$("[data-page='"+cur_page+".0'] .sbtn-wrapper").animate({
		marginLeft:"0px"
	});
	isFold = 0;
	function scroll_left(){
		if(cur_page > 0 && !isFold){
			$(".sbtn-group").animate({
				marginLeft:"+="+200*PER_PAGE+"px"
			}); 
			cur_page--;
			for(var j = cur_page ; j < page_count ; j++){
				$("[data-page='"+j+".0']").css("margin-left","0");
			}
		}
	}
	function scroll_right(){
		if(cur_page < parseInt(page_count-1) && !isFold){
			var i = cur_page;
			for(var j = cur_page ; j>=0 ; j--){
				$("[data-page='"+j+".0']").animate({
					marginLeft:"-="+200*PER_PAGE+"px"
				}); 
			}
			cur_page++;
			for(var j = cur_page ; j < page_count ; j++){
				$("[data-page='"+j+".0']").css("margin-left","0");
			}
		}
	}
	var isFold = 0;
	function fold_models(){
		if(!isFold){
			$("[data-page='"+cur_page+".0'] .sbtn-wrapper").animate({
				marginLeft:"-="+200*PER_PAGE+"px"
			}); 
			isFold = 1;
		}else{
			$("[data-page='"+cur_page+".0'] .sbtn-wrapper").animate({
				marginLeft:"0px"
			});
			isFold = 0;
		}
	}
	</script>
</body>
</html>