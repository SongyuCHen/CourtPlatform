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


<script src="${pageContext.request.contextPath}/lib/picshow2/js/jQuery-1.7.1.js" language="javascript" type="text/javascript"></script>
	<script type="text/javascript"
	src="${pageContext.request.contextPath}/lib/picshow3/ZoomPic.js"></script>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif,"新宋体"; background-color:#2A2A2A}
/* focus_Box */
#focus_Box{position:relative;width:800px;height:308px;margin:20px auto;}
#focus_Box ul{position:relative;width:710px;height:308px;margin-left:30px}
#focus_Box li{z-index:0;position:absolute; width:0px;background:#787878;height:0px;top:146px;cursor:pointer;left:377px;border-radius:4px;}
#focus_Box li img{width:100%;background:url(${pageContext.request.contextPath}/lib/picshow3/images/loading.gif) no-repeat center 50%;height:100%;vertical-align:top}
#focus_Box li p{position:absolute;left:0;bottom:0px;width:100%;height:40px;line-height:40px;background:url(${pageContext.request.contextPath}/lib/picshow3/images/float-bg.png) repeat;text-indent:8px;color:#fff;}
#focus_Box li p span{display:inline-block;width:70%;height:40px;overflow:hidden;}
#focus_Box .prev,#focus_Box .next{display:block;z-index:100;overflow:hidden;cursor:pointer;position:absolute;width:52px;height:52px;top:131px;}
#focus_Box .prev{background:url(${pageContext.request.contextPath}/lib/picshow3/images/btn.png) left bottom no-repeat;left:-30px}
#focus_Box .next{background:url(${pageContext.request.contextPath}/lib/picshow3/images/btn.png) right bottom no-repeat;right:-30px} 
#focus_Box .prev:hover{background-position:left top;}
#focus_Box .next:hover{background-position:right top;}
#focus_Box a.imgs-scroll-btn{display:block;position:absolute;z-index:110;top:7px;right:15px;width:51px;height:23px;overflow:hidden;background:url(${pageContext.request.contextPath}/lib/picshow3/images/share-btn.png) no-repeat;text-indent:-999px;}
</style>

<title>院史陈列</title>
</head>
<body>
<div class="back" style="width:500px;height:100px;float:left">
	<a href="${pageContext.request.contextPath}/index" style="width:500px;height:100px;display: inline-block"></a>
</div>
	<div class="icon-container">
	<div id="focus_Box">
	<span class="prev">&nbsp;</span>
	<span class="next">&nbsp;</span>
	<ul>
	<c:forEach items="${awards}" var="as" varStatus="status"> 
		<li>
			<a href="#"><img width="500" height="450" alt="Photo sharing jq22" src="${pageContext.request.contextPath}/images/award/${as.c_img}" /></a>
			<p>
				<span>${as.title}</span>
			</p>
		</li>
	</c:forEach>
	</ul>
</div>
	</div>



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
				if(o%5 == 0){
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
		//$(".btn-bar .sbtn:first").click();
		/* var i = 0;
		$(".sbtn-wrapper").each(function(){
			$(this).css("left",465+200*i+"px");
			i++;
		}); */
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