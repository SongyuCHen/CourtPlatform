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
<title>业务应用系统</title>
<style type="text/css">
.kjft{
	float:left;
	background-image: url(${pageContext.request.contextPath}/images/kjft-bg.png);
	width: 200px;
    height: 200px;
    background-size: 100%;
    background-repeat: no-repeat;
    margin-left: 20px;
    margin-top: 5px;
}
.icon-container{
    padding-left: 25px;
}
.kjft-title{
	color: white;
    width: 100%;
    text-align: center;
    margin-top: 5px;
}
.fy{
	margin-top: 5px;
    margin-left: 20px;
    font-weight: 900;
    line-height: 1.5em;}
.fy img{
width:16px;
margin-right:10px}
.tip{
	position: relative;
    left: -50px;
    top: 40px;
    width: 12px;
}
</style>
</head>
<body>
<div class="back" style="width:500px;height:100px;float:left">
	<a href="${pageContext.request.contextPath}/index" style="width:500px;height:100px;display: inline-block"></a>
</div>
	<div class="icon-container">
		<div style="float:left;">
			<img alt="" src="${pageContext.request.contextPath}/images/big_map.png" style="width: 270px;height:400px;margin-top:20px;margin-left: -10px;float:left">	
			<%-- <img class="tip" alt="" src="${pageContext.request.contextPath}/images/tip.png">
			<img class="tip" alt="" src="${pageContext.request.contextPath}/images/tip.png">
			<img class="tip" alt="" src="${pageContext.request.contextPath}/images/tip.png">
			<img class="tip" alt="" src="${pageContext.request.contextPath}/images/tip.png">
			<img class="tip" alt="" src="${pageContext.request.contextPath}/images/tip.png">
			<img class="tip" alt="" src="${pageContext.request.contextPath}/images/tip.png"> --%>
		</div>
		<div style="float:left;width:240px;height:380px;margin-left:20px;background-size:100% 100%;background-repeat:no-repeat;background-image: url(${pageContext.request.contextPath}/images/fy-list.png);">
			<div class="fy" style="margin-top:60px"><img alt="" src="${pageContext.request.contextPath}/images/kjft-file.png"><span>定西市中级人民法院</span></div>
			<div class="fy"><img alt="" src="${pageContext.request.contextPath}/images/kjft-file.png"><span>安定区人民法院</span></div>
			<div class="fy"><img alt="" src="${pageContext.request.contextPath}/images/kjft-file.png"><span>通渭县人民法院</span></div>
			<div class="fy"><img alt="" src="${pageContext.request.contextPath}/images/kjft-file.png"><span>渭源县人民法院</span></div>
			<div class="fy"><img alt="" src="${pageContext.request.contextPath}/images/kjft-file.png"><span>临洮县人民法院</span></div>
		</div>
		<div style="margin-left:20px">
			<div class="kjft">
				<div class="kjft-title">第一科技法庭</div>
				<div>
					<img alt="" src="${pageContext.request.contextPath}/images/kjft-test.png" width="190" style="padding:10px 5px">
				</div>
			</div>
			<div class="kjft"></div>
			<div class="kjft"></div>
			<div class="kjft"></div>
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
		$.ajax({url:"${pageContext.request.contextPath}/app"+"/subsys",data:{"url":url},type:"post",dataType:"json",async:false,success:function(data){
			/* $(".icon-line").remove();
			$(".icon-container").empty();
			var line;
			var models = data.modelMap.menuContext.subModels;
			for(var o in models){
				if(o%6 == 0){
					 line = document.createElement("div");
					 $(line).attr("class","icon-line") ;
					 $(".icon-container").append(line);
				}
				$(line).append("<div class=\"icon\" id=\""+models[o].c_url+"\"\><img src=\"${pageContext.request.contextPath}/images/icon/"+models[o].c_img+"\"/></div>");
			} */
			
		}});
	}
	$(function(){
		$(".btn-bar .sbtn:first").click();
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
	
	var pos = {"dx":{
					"0":{"left":"-160","top":"40"},
					"1":{"left":"-160","top":"60"},
					"2":{"left":"-220","top":"40"},
					"3":{"left":"-220","top":"70"},
					"4":{"left":"-200","top":"100"},
					"5":{"left":"-280","top":"100"},
					"6":{"left":"-240","top":"120"},
					"7":{"left":"-230","top":"110"},
					"8":{"left":"-300","top":"100"},
					"9":{"left":"-320","top":"130"}
				},
				"lt":{
					"0":{"left":"-350","top":"40"},
					"1":{"left":"-390","top":"130"},
					"2":{"left":"-370","top":"150"},
					"3":{"left":"-330","top":"70"},
					"4":{"left":"-340","top":"100"}
				},
				"wy":{
					"0":{"left":"-300","top":"200"},
					"1":{"left":"-390","top":"180"},
					"2":{"left":"-300","top":"150"},
					"3":{"left":"-330","top":"200"},
					"4":{"left":"-280","top":"170"}
				},
				"lx":{
					"0":{"left":"-230","top":"200"},
					"1":{"left":"-320","top":"180"},
					"2":{"left":"-230","top":"150"},
					"3":{"left":"-260","top":"200"},
					"4":{"left":"-210","top":"170"}
				},
				"tw":{
					"0":{"left":"-130","top":"200"},
					"1":{"left":"-220","top":"180"},
					"2":{"left":"-220","top":"150"},
					"3":{"left":"-210","top":"170"},
					"4":{"left":"-110","top":"170"}
				},
				"zx":{
					"0":{"left":"-310","top":"230"},
					"1":{"left":"-230","top":"260"},
					"2":{"left":"-290","top":"240"},
					"3":{"left":"-360","top":"270"},
					"4":{"left":"-240","top":"300"}
				},
				"mx":{
					"0":{"left":"-290","top":"300"},
					"1":{"left":"-370","top":"340"},
					"2":{"left":"-400","top":"270"},
					"3":{"left":"-230","top":"310"},
					"4":{"left":"-240","top":"340"}
				}
			};
	</script>
</body>
</html>