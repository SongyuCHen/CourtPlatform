<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/index/index.css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/cp_common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/index/index.js"></script>
<script type="text/javascript">
var width = window.screen.availWidth;
$.ajax({url:"${pageContext.request.contextPath}/index/savewidth",
	data:{"width":width},
	type:"post",
	dataType:"json",
	async:false,
	success:function(data){
		console.log("width log");
	}
});
</script>
<title>定西法院系统集成平台</title>
</head>
<body>
	<div class="btn-bar">
		<div id="app" class="btn-wrapper">
			<div class="index-btn unhovered" onclick="toBusiness()">
				<div class="text">应用平台</div>
			</div>
			<div class="index-btn-shadow"></div>
		</div>
		<div id="video" class="btn-wrapper">
			<div class="index-btn unhovered" onclick="toSPJK()">
				<div class="text">视频集控</div>
			</div>
			<div class="index-btn-shadow"></div>
		</div>
		<div id="data" class="btn-wrapper">
			<div class="index-btn unhovered" onclick="toSJZX()">
				<div class="text">数据中心</div>
			</div>
			<div class="index-btn-shadow"></div>
		</div>
		<div id="detail" class="btn-wrapper">
			<div class="index-btn unhovered" onclick="toZJDX()">
				<div class="text">法院风采</div>
			</div>
			<div class="index-btn-shadow"></div>
		</div>
	</div>
</body>
</html>