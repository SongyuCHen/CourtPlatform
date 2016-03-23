<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include  file="./template/head.jsp"%>
	<link href="${pageContext.request.contextPath}/css/backend/sjrbMan.css" rel="stylesheet">
  </head>

<body>
 <%@ include  file="./template/navbar.jsp"%>


 <div class="container-fluid">
   <div class="row">
     <%@ include  file="./template/menu.jsp"%>
     <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 content">
     <h2 style="display:inline-block">服务器列表</h2>
        <div class="btn btn-primary" style="float:right;margin:20px 5% 0 0" data-toggle="modal" data-target="#myModal">新建</div>
     <hr />
     	<table class="table table-striped">
     		<thead>
     			<tr>
      			<th>#</th>
      			<th>名称</th>
      			<th>ip</th>
      			<th>端口</th>
      			<th>操作</th>
     			</tr>
     		</thead>
     		<tbody>
     			<tr id="test">
      			<td>1</td>
      			<td>
      				<p>安定区法院</p>
      				<input class="form-control"  type="text" value="安定区法院" style="display: none;">
      			</td>
      			<td>
      				<p>155.36.0.2</p>
      				<input class="form-control"  type="text" value="155.36.0.2" style="display: none;">
      			</td>
      			<td>
      				<p>8080</p>
      				<input class="form-control"  type="text" value="8080" style="display: none;">
      			</td>
      			<td>
				<button type="button"  class="btn btn-default" onclick="reviseCall(this)" >修改</button>
				<button type="button"  class="btn btn-default" onclick="save(this)" >保存</button>
			</td>
		</tr>
     		</tbody>
     	</table>
     </div>
  </div>
</div>


   
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">增加服务器项</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">标题</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="titleInputNew">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">IP</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="IPInputNew">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">端口</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="PortInputNew">
				    </div>
				  </div>
			</form>
      </div>
      <div class="modal-footer">
      	<span style="color:red"></span>
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" onclick="addSub()">保存</button>
      </div>
    </div>
  </div>
</div>



<%@ include  file="./template/footer.jsp"%>
<script type="text/javascript">
$(function(){
 $(".sidebar .active").removeClass("active");
 $(".sidebar #servers").addClass("active");
});

function reviseCall(e){
 var p = $(e).parents("tr");
 $(p).find("input").show();
 $(p).find("p").hide();
}
function save(e){
 var p = $(e).parents("tr");
 $(p).find("input").hide();
 $(p).find("p").show();
}
</script>
</body>
</html>
</html>