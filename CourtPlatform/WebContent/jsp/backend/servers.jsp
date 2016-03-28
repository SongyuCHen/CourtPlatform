<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
     		<c:forEach items="${servers}" var="ss" varStatus="status"> 
     			<tr id="tr${ss.bh }">
		      			<td>${status.index+1 }</td>
		      			<td>
		      				<p id="titleP${ss.bh }">${ss.title }</p>
		      				<input class="form-control" id="titleInput${ss.bh }"  type="text" value="${ss.title }" style="display: none;">
		      			</td>
		      			<td>
		      				<p id="IPP${ss.bh }">${ss.IP }</p>
		      				<input class="form-control" id="IPInput${ss.bh }"  type="text" value="${ss.IP }" style="display: none;">
		      			</td>
		      			<td>
		      				<p id="portP${ss.bh }">${ss.port }</p>
		      				<input class="form-control" id="portInput${ss.bh }" type="text" value="${ss.port }" style="display: none;">
		      			</td>
		      			<td>
							<button type="button"  class="btn btn-default revise revise${ss.bh }" onclick="reviseCall(this)" >修改</button>
							<button type="button"  class="btn btn-default save save${ss.bh }" onclick="save(this,${ss.bh })" >保存</button>
							<button type="button"  class="btn btn-default delete delete${ss.bh }" onclick="remove1(this,${ss.bh })" >删除</button>
						</td>
				</tr>
			</c:forEach>
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
				      <input type="text" class="form-control" id="portInputNew">
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
<script type="text/javascript">
$(function(){
 $(".sidebar .active").removeClass("active");
 $(".sidebar #servers").addClass("active");
 $(".revise").show();
 $(".delete").show();
 $(".save").hide();
});

function reviseCall(e){
 var p = $(e).parents("tr");
 $(p).find("input").show();
 $(p).find("p").hide();
 $(".revise").hide();
 $(".delete").hide();
 $(".save").show();
}
function remove1(e,bh){
	 //删除信息
	   $.ajax(
			{url:"${pageContext.request.contextPath}/backend/deleteserver",
				type:"post",
				dataType:"json",
				data:{
					"bh":bh
				},
				async:false,
				success:function(data){
					var result = data.model.status;
					if(result){
					   $("#tr"+bh).remove();
					   revealCall("删除成功！");
					}else{
						revealCall("删除失败！");
					}
				}
			});	
}

function addSub(){
	 if($("#titleInputNew").val() == "" || $("#IPInputNew").val() == ""
			|| $("#portInputNew").val() == ""){
		$(".modal-footer span").html("请将数据填写完整");
		return;
		}
	   //保存信息
	   $.ajax(
			{url:"${pageContext.request.contextPath}/backend/saveserver",
				type:"post",
				dataType:"json",
				data:{
					"title":$("#titleInputNew").val(),
					"ip":$("#IPInputNew").val(),
					"port":$("#portInputNew").val()
				},
				async:false,
				success:function(data){
					revealCall("添加成功！");
					history.go(0);
				}
			});	
}

function save(e,bh){
	   
	   if($("#titleInput"+bh).val() == "" || $("#IPInput"+bh).val() == ""
			|| $("#portInput"+bh).val() == ""){
		revealCall("请填写完整！");
		return;
	}
	   $.ajax({
		   url:"${pageContext.request.contextPath}/backend/reviseserver",
		   type:"post",
		   dataType:"json",
		   data:{
			   "bh":bh,
			   "title":$("#titleInput"+bh).val(),
				"ip":$("#IPInput"+bh).val(),
				"port":$("#portInput"+bh).val()
		   },
		   async:false,
				success:function(data){
					var result = data.model.status;
					if(result){
						$("#titleP"+bh).html($("#titleInput"+bh).val());
						$("#IPP"+bh).html($("#IPInput"+bh).val());
						$("#portP"+bh).html($("#portInput"+bh).val());
						 var p = $(e).parents("tr");
						 $(p).find("input").hide();
						 $(p).find("p").show();
						 $(".revise").show();
						 $(".delete").show();
						 $(".save").hide();
					   revealCall("保存成功！");
					}else{
						revealCall("保存失败！");
					}
				}
		   
	   });
}	   
</script>

<%@ include  file="./template/footer.jsp"%>
</body>
</html>
</html>