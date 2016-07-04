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
<div class="back" style="width:500px;height:100px;float:left">
	<a href="${pageContext.request.contextPath}/index" style="width:500px;height:100px;display: inline-block"></a>
</div>
<div class="icon-container">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sjzx/fwqyxjk.css" />
	<div class="left-col">
	<c:forEach items="${servers}" var="ss" varStatus="status">
		<p data-bh="${ss.bh}">${ss.title }</p>	
	</c:forEach>
	</div>
	<div class="right-col">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<td>
					<h3>系统</h3>
					<div>
					<p id="sysName">系统名称：${machine.systemInfo.getSysname()}</p>
					<p id="sysVer">系统版本：${machine.systemInfo.getVersion()}</p>
					<p id="sysArch">系统类型：${machine.systemInfo.getArch()}</p>
					</div>
				</td>
				<td>
					<h3>内存使用</h3>
					<div>
					<p id="memTotal">内存总量：${machine.memoryInfo.getTotal()}</p>
					<p id="memUsed">已使用量：${machine.memoryInfo.getUsed()}</p>
					<p id="memFree">已使用率：${machine.memoryInfo.getPercent()}</p>
					</div>
				</td>
				<td>
					<h3>CPU</h3>
					<div>
					<p id="cpuNum">核心数量：${machine.cpuInfo.getCpunum()}</p>
					<p id="cpuType">CPU类型：${machine.cpuInfo.getVender()} ${machine.cpuInfo.getModel()}(${machine.cpuInfo.getRate()})</p>
					<p id="cpuCache">CPU缓存：${machine.cpuInfo.getCachesize()}</p>
					</div>
				</td>
			</tr>
				
			<tr>
				
				<td colspan="3" id="disks">
					<h3>硬盘使用</h3>
					<div>
					<c:forEach items="${machine.fileSystems}" var="fs" varStatus="status"> 
						<div class="fs" style="float:left;margin-top:10px">
							<p>盘符名称：${fs.getDevname()}</p>
							<p>硬盘容量：${fs.getTotal()}</p>
							<p>已使用量：${fs.getUsed()}</p>
							<p>已使用率：${fs.getPercent()}</p>
						</div>
					</c:forEach>
					</div>
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
			$(".icon-container").empty();
			var line;
			var models = data.modelMap.menuContext.subModels;
			if(models.length != 0){
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
			}else{
				window.location.href="${pageContext.request.contextPath}"+url;
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
	
	$(function(){
		$(".left-col p").click(function(e){
			$(".nav").attr("class","");
			$(this).attr("class","nav");
			$.ajax({
				url:"${pageContext.request.contextPath}/sjzx/fwqdata",
				type:"post",
				dataType:"JSON",
				async:false,
				data:{"bh":$(this).data("bh")},
				success:function(data){
					var info = data.model.machine;
					$("#sysName").html("系统名称："+info.systemInfo.sysname);
					$("#sysVer").html("系统版本："+info.systemInfo.version);
					$("#sysArch").html("系统类型："+info.systemInfo.arch);
					$("#memTotal").html("内存总量："+info.memoryInfo.total);
					$("#memUsed").html("已使用量："+info.memoryInfo.used);
					$("#memFree").html("已使用率："+info.memoryInfo.percent);
					$("#cpuNum").html("核心数量："+info.cpuInfo.cpunum);
					$("#cpuType").html("CPU类型："+info.cpuInfo.vender+" "+info.cpuInfo.model+"("+info.cpuInfo.rate+")");
					$("#cpuCache").html("CPU缓存："+info.cpuInfo.cachesize);
					$("#disks").empty();
					$("#disks").html("<h3>硬盘使用</h3><p class='devuse'></p>");
					var i = info.fileSystems;
					for(var o in i){
				 		$(".devuse").append("<div class=\"fs\" style=\"float:left;margin-right:10px;margin-top:10px\"><p>盘符名称："+i[o].devname+
								"</p><p>硬盘容量："+i[o].total+
								"</p><p>已使用量："+i[o].used+
								"</p><p>已使用率："+i[o].percent.substr(0,i[o].percent.indexOf(".")+3)+"%</p></div>");
					}
				}
			});
		});
		$(".left-col p:first").click();
	})
	</script>
</body>
</html>