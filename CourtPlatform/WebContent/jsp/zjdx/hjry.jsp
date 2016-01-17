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
	<%-- 
<!-- timeline -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/lib/timeline/css/history.css">
<style type="text/css">
	.icon-container{
		padding-top:100px !important;
	}
	#history{
		margin:20px auto;
		padding-top:20px;
		background-color: rgba(255,255,255,0.5);
		border-radius:5px
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/timeline/js/jquery.mousewheel.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/timeline/js/jquery.easing.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/timeline/js/history.js"></script> --%>
<style>
.flexslider {
	margin: 0px auto 20px;
	position: relative;
	width: 100%;
	height: 482px;
	overflow: hidden;
	zoom: 1;
}

.flexslider .slides li {
	width: 100%;
	height: 100%;
}

.flex-direction-nav a {
	width: 70px;
	height: 70px;
	line-height: 99em;
	overflow: hidden;
	margin: -35px 0 0;
	display: block;
	background: url(${pageContext.request.contextPath}/lib/picshow/images/ad_ctr.png) no-repeat;
	position: absolute;
	top: 50%;
	z-index: 10;
	cursor: pointer;
	opacity: 0;
	filter: alpha(opacity=0);
	-webkit-transition: all .3s ease;
	border-radius: 35px;
}

.flex-direction-nav .flex-next {
	background-position: 0 -70px;
	right: 0;
}

.flex-direction-nav .flex-prev {
	left: 0;
}

.flexslider:hover .flex-next {
	opacity: 0.8;
	filter: alpha(opacity=25);
}

.flexslider:hover .flex-prev {
	opacity: 0.8;
	filter: alpha(opacity=25);
}

.flexslider:hover .flex-next:hover,
.flexslider:hover .flex-prev:hover {
	opacity: 1;
	filter: alpha(opacity=50);
}

.flex-control-nav {
	width: 100%;
	position: absolute;
	bottom: 10px;
	text-align: center;
	padding:0;
}

.flex-control-nav li {
	margin: 0 2px;
	display: inline-block;
	zoom: 1;
	*display: inline;
}
.icon-container li{
	list-style-type:none;
}

.flex-control-paging li a {
	background: url(${pageContext.request.contextPath}/lib/picshow/images/dot.png) no-repeat 0 -16px;
	display: block;
	height: 16px;
	overflow: hidden;
	text-indent: -99em;
	width: 16px;
	cursor: pointer;
}

.flex-control-paging li a.flex-active,
.flex-control-paging li.active a {
	background-position: 0 0;
}

.flexslider .slides a img {
	width: 100%;
	height: 452px;
	display: block;
}
.icon-container{
	width:80%;
	padding-top:110px !important;
	margin:0 10%;
}
.zimu{
    position: fixed;
    top: 480px;
    width: 485px;
    line-height: 50px;
    background-color: rgba(0,0,0,0.3);
    color: white;
    left: 31%;
    text-align: center;
}

</style>
<title>院史陈列</title>
</head>
<body>

	<div class="icon-container">
		<!-- 轮播广告 -->
<div id="banner_tabs" class="flexslider">
	<ul class="slides">
		<li>
			<a title="">
				<img width="1920" height="452"  alt="" style="background-image: url(${pageContext.request.contextPath}/images/fy/anding.png); background-repeat: no-repeat; background-position:center;"
				src="${pageContext.request.contextPath}/lib/picshow/images/alpha.png"
				 data-url="${pageContext.request.contextPath}/images/fy/anding.png" data-zimu="2014-2015年度甘肃省青年文明号">
			</a>
		</li>
		<li>
			<a title="">
				<img width="1920" height="452"  alt="" style="background-image: url(${pageContext.request.contextPath}/images/fy/lintao.png); background-repeat: no-repeat; background-position:center;"
				src="${pageContext.request.contextPath}/lib/picshow/images/alpha.png"
				 data-url="${pageContext.request.contextPath}/images/fy/lintao.png" data-zimu="2014-2015年度甘肃省青年文明号111">
			</a>
		</li>
		<li>
			<a title="" >
				<img width="1920" height="452" alt="" style="background-image: url(${pageContext.request.contextPath}/images/fy/zhongyuan.png); background-repeat: no-repeat; background-position:center;"
				src="${pageContext.request.contextPath}/lib/picshow/images/alpha.png"
				 data-url="${pageContext.request.contextPath}/images/fy/zhongyuan.png" data-zimu="2014-2015年度甘肃省青年文明号222">
			</a>
		</li>
	</ul>
	<ul class="flex-direction-nav">
		<li><a class="flex-prev" href="javascript:;">Previous</a></li>
		<li><a class="flex-next" href="javascript:;">Next</a></li>
	</ul>
	<ol id="bannerCtrl" class="flex-control-nav flex-control-paging">
		<li><a>1</a></li>
		<li><a>2</a></li>
		<li><a>2</a></li>
	</ol>
</div>
<script src="${pageContext.request.contextPath}/lib/picshow/js/slider.js"></script>
<script type="text/javascript">
var _IMG_HEIGHT=600;
var _IMG_WIDTH = 1920;
$(function() {
	
})
</script>
	</div>

<div class="zimu">2014-2015年度甘肃省青年文明号</div>





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
					window.location.href="${pageContext.request.contextPath}/zjdx"+"/yscl";
				});
			}
		}});
	}
	$(function(){
		//$(".btn-bar .sbtn:first").click();
		/* var i = 0;
		$(".sbtn-wrapper").each(function(){
			$(this).css("left",465+200*i+"px");
			i++;
		}); */
		$(".slides img").on("load",function(){
			var i = new Image();
			i.src = $(this).attr('data-url');
	        var w = i.width;
	        var h = i.height;
	        if(w/h > _IMG_WIDTH/_IMG_HEIGHT ){
	        	if(w>_IMG_WIDTH){
		        	var p = _IMG_WIDTH*100/w;
		        	$(this).css("background-size",p+"%");
	        	}
	        }else{
	        	if(h>_IMG_HEIGHT){
		        	var p = _IMG_HEIGHT*100/h;
		        	$(this).css("background-size",p+"%");
	        	}
	        }
			var bannerSlider = new Slider($('#banner_tabs'), {
				time: 5000,
				delay: 400,
				event: 'hover',
				auto: true,
				mode: 'fade',
				controller: $('#bannerCtrl'),
				activeControllerCls: 'active'
			});
	    });
		$('#banner_tabs .flex-prev').click(function() {
			bannerSlider.prev();
		});
		$('#banner_tabs .flex-next').click(function() {
			bannerSlider.next();
		});
		$(".slides a").click(function(){
			$('#banner_tabs .flex-next').click();
		});
		
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