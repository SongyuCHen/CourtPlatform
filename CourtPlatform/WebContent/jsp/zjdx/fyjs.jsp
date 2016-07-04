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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/zjdx/fyjs.css" />
<img src="${pageContext.request.contextPath}/images/map.png" border="0" usemap="#map" alt="Planets" />
<map name="map">
    <area name="anding" data-fy-name="安定区人民法院"  data-fy-class="622421R91" data-reveal-id="modal" shape="poly" coords="150,1,150,7,169,28,173,28,173,33,176,37,184,45,188,45,190,61,184,76,190,84,182,99,181,103,174,104,166,93,154,97,146,94,136,94,126,100,119,95,107,95,104,88,96,77,96,67,105,56,105,48,119,25,119,13,126,5" href="#" />
    <area name="tongwei" data-fy-name="通渭县人民法院"  data-fy-class="622424R92" data-reveal-id="modal" shape="poly" coords="192,85,198,81,202,88,208,84,214,78,225,78,236,81,240,88,248,97,255,96,258,103,258,110,260,116,266,113,268,119,269,127,260,126,256,141,244,129,241,138,232,138,233,143,222,143,221,154,216,157,211,153,200,151,194,159,185,154,180,157,176,152,174,138,169,135,173,126,172,117,174,111" href="#" />
    <area name="longxi" data-fy-name="陇西县人民法院"  data-fy-class="622425R93" data-reveal-id="modal" shape="poly" coords="125,103,134,99,140,96,146,97,156,100,162,97,168,101,174,106,170,114,168,119,172,123,169,130,168,137,172,139,173,144,175,151,179,157,178,169,158,168,146,167,142,171,138,164,116,161,109,155,107,146,112,131,109,127,114,118,116,112" href="#" />
    <area name="lintao"  data-fy-name="临洮县人民法院" data-fy-class="622427R95" data-reveal-id="modal" shape="poly" coords="1,25,1,17,9,15,13,19,19,13,26,19,32,17,82,59,90,57,94,63,95,78,104,85,103,96,91,91,84,93,84,102,76,113,68,119,60,111,50,118,48,127,40,129,41,137,34,134,30,124,29,117,32,109,35,103,39,97,42,91,43,86,46,79,42,69" href="#" />
    <area name="weiyuan"  data-fy-name="渭源县人民法院" data-fy-class="622426R94" data-reveal-id="modal" shape="poly" coords="40,137,41,129,47,129,52,119,60,112,66,122,80,115,84,105,88,94,99,94,108,97,118,96,125,100,114,112,110,129,114,135,106,149,102,155,98,160,79,153,76,161,67,161,56,155,46,151,35,139" href="#" />
    <area name="zhangxian" data-fy-name="漳县人民法院"  data-fy-class="622428R96" data-reveal-id="modal" shape="poly" coords="80,153,95,159,108,154,116,163,136,164,142,171,142,178,142,187,142,195,153,193,152,207,160,214,161,217,154,224,140,217,136,219,134,210,126,210,122,205,113,205,106,212,92,206,94,199,78,197,78,183,62,179,60,168,74,163" href="#" />
    <area name="minxian"  data-fy-name="岷县人民法院" data-fy-class="622429R97" data-reveal-id="modal" shape="poly" coords="47,179,44,185,47,193,44,203,42,210,35,210,40,227,33,234,29,239,29,249,41,249,50,253,58,262,69,271,76,260,90,261,89,250,80,247,85,241,91,239,98,239,104,241,106,236,114,240,120,245,120,251,135,263,144,258,150,254,160,253,166,255,174,252,176,245,172,236,190,236,191,225,174,225,164,222,164,215,152,223,136,219,134,212,122,209,116,205,106,211,96,209,92,207,94,199,84,197,78,197,78,183,63,181" href="#" />
</map>
<div class="description">
	<h3><b>定西法院介绍</b></h3>
	<hr style="width:90%;border:0;border-bottom:#ccc solid 1px;" />
	<!-- <p>定西市地处黄河上游，位于甘肃中部，通称“陇中”。 管辖1区<a href="#">6</a>县，119个乡（镇），总人口296.55万人，总面积2.03万平方公里。全市自然条件恶劣，在历史上有“陇中苦甲天下”之称。全市“一区六县”均属国家重点扶持的贫困地区。定西历史悠久，区位优势明显。这里是黄河上游文明的重要发祥地，有新石器时代著名的马家窑文化、齐家文化、寺洼文化和辛甸文化。自古就是丝绸之路的“重镇”，又是新欧亚大陆桥的必经之地，同时还是甘肃省会兰州市的东大门，距兰州市仅98公里。陇海铁路和310、312、212、316国道穿境而过，特别是近年来，宝兰铁路复线的建成和兰定、兰临等高速公路的建成通车，使定西“兰州门户”的区位优势更加突出。</p>
	<p>定西中院辖安定、通渭、陇西、临洮、渭源、漳县、岷县7个基层人民法院，40个人民法庭。两级法院共有干警584人，其中男444，女140人。法官403人，占69%；其他司法辅助人员181人，占31%。大学以上学历的475人（其中全日制大学133），占81.3%；大专学历的74人，占12.7%。年龄35岁以下的143人，占24.5%；36-45岁的182人，占31.2%；46-55岁的217人，占37.2%；56岁以上的42人，占7.1%。2010年全市法院受理各类案件16994件，审（执）结16517件，结案率97.19%；2011年全市法院受理各类案件17067件，审（执）结16700件，结案率97.85%；2012年全市法院受理各类案件19097件，审（执）结18813件，结案率98.51%。</p>
	<p>中院现有公务员89人，工人4人,聘用制司法警察10人，另有聘用制书记员13人（不占编制），共计116人，男85人，女31人；中共党员86人。公务员中法官66人，占74%；其他司法辅助人员23名，占26%。公务员中大学以上学历的71人（其中全日制大学15人），占80%；大专学历18人，占20%。公务员中年龄35岁以下的8人，占9%；36-45岁的22人，占25%；46-55岁的42人，占47%；56岁以上的17人，占19.1%。</p>
	<p>  中院班子成员8人，审判委员会专职委员2人。副地1人，正处14人，副处22人，正科级29人、副科级9人，科员14人。内设政治部、纪检组、办公室等20个机构，其中政治部、法警支队、执行局为正处建制，其余17个部门均为副处级建制。</p>
 -->
 	${description}
 </div>
<div class="info_box">
	<img width="100" height="100">
	<p></p>
</div>
<script type="text/javascript">
	$("area").mousemove(function(e){
		var oEvent=e||event;
		var oLeft=(oEvent.clientX-135)+"px";
		var oTop=(oEvent.clientY-65)+"px";
		$(".info_box").css("left",oLeft);
		$(".info_box").css("top",oTop);
		$(".info_box").show();
		$(".info_box img").attr("src","${pageContext.request.contextPath}/images/fy/"+$(this).attr("name")+".png");
		$(".info_box p").html($(this).attr("data-fy-name"));
	});
	$(".icon-container img").mouseout(function(){
		$(".info_box").hide();
	});
	
</script>
		<%-- <div class="icon-line">
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
		</div>
		<div class="icon-line">
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
			<div class="icon">
				<img src="${pageContext.request.contextPath}/images/icon/fyxt.png"/>
			</div>
		</div> --%>
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