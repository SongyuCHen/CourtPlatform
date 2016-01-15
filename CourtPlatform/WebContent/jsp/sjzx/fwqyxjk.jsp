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
</head>
<body>
<div class="icon-container">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sjzx/fwqyxjk.css" />
	<div class="left-col">
		<p>服务器1</p>
		<p>服务器2</p>
		<p>服务器3</p>
		<p>服务器4</p>
		<p>服务器5</p>
		<p>服务器6</p>
		<p>服务器7</p>
		<p>服务器8</p>
		<p>服务器9</p>
		<p>服务器10</p>
	</div>
	<div class="right-col">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<h3>系统</h3>
					<div>
					<p>系统名称：${machine.systemInfo.getName()}</p>
					<p>系统版本：${machine.systemInfo.getVersion()}</p>
					<p>系统类型：${machine.systemInfo.getArch()}</p>
					</div>
				</td>
				<td>
					<h3>内存使用</h3>
					<div>
					<p>内存总量：${machine.memoryInfo.getMemTotal()}</p>
					<p>已使用量：${machine.memoryInfo.getMemUsed()}</p>
					<p>未使用量：${machine.memoryInfo.getMemNotUsed()}</p>
					</div>
				</td>
				<td>
					<h3>CPU</h3>
					<div>
					<p>核心数量：${machine.cpuInfo.getCPUnum()}</p>
					<p>CPU类型：${machine.cpuInfo.getVender()} ${machine.cpuInfo.getModel()}(${machine.cpuInfo.getRate()})</p>
					<p>CPU缓存：${machine.cpuInfo.getCache()}</p>
					</div>
				</td>
			</tr>
				
			<tr>
				
				<td colspan="3">
					<h3>硬盘使用</h3>
					<c:forEach items="${machine.fileSystems}" var="fs" varStatus="status"> 
						<div class="fs" style="float:left">
							<p>盘符名称：${fs.getName()}</p>
							<p>硬盘容量：${fs.getTotal()}</p>
							<p>已使用量：${fs.getUsed()}</p>
							<p>已使用率：${fs.getPercent()}</p>
						</div>
					</c:forEach>
				</td>
			</tr>
		</table>
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
					window.location.href="${pageContext.request.contextPath}/sjzx"+"/business";
				});
			}
			
		}});
	}
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