<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		</div>
	</div>








	<div class="btn-bar">
		<div class="btn-wrapper">
			<div class="index-btn unhovered">
				<div class="text">${menuContext.currentModel.name}</div>
			</div>
			<div class="index-btn-shadow"></div>
		</div>
		<c:forEach items="${menuContext.subModels}" var="subModel"> 
		<div class="sbtn-wrapper">
			<div class="sbtn unhovered" onclick="show_sub_system('${subModel.c_url}',this)">
				<div class="text">${subModel.name}</div>
			</div>
			<div class="sbtn-shadow"></div>
		</div>
		</c:forEach>

		
	</div>
	<div class="board">
	</div>
	<script type="text/javascript">
	function show_sub_system(url,e){
		$(".active").attr("class","sbtn unhovered");
		$(e).attr("class",$(e).attr("class")+" active");
		$.ajax({url:"${pageContext.request.contextPath}/app"+"/subsys",data:{"url":url},type:"post",dataType:"json",async:false,success:function(data){
			//$scope.content = data;
			alert(data);
		}});
	}
	</script>
</body>
</html>