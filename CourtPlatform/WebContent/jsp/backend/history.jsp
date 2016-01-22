<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include  file="./template/head.jsp"%>
	<link href="${pageContext.request.contextPath}/css/backend/fylsMan.css" rel="stylesheet">
  </head>

<body>
 <%@ include  file="./template/navbar.jsp"%>


    <div class="container-fluid">
      <div class="row">
        <%@ include  file="./template/menu.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 content">
        	<table class="table table-striped">
        		<thead>
        			<tr>
	        			<th>#</th>
	        			<th>标题</th>
	        			<th>时间</th>
	        			<th>内容</th>
	        			<th>图片</th>
	        			<th>操作</th>
        			</tr>
        		</thead>
        		<tbody>
        			<tr id="test">
	        			<td>1</td>
	        			<td>
	        				<p>建院</p>
	        				<input class="form-control"  type="text" value="建院" style="display: none;">
	        			</td>
	        			<td>
	        				<p>2015/2/3</p>
	        				<input class="form-control"  type="text" value="2015/2/3" style="display: none;">
	        			</td>
	        			<td>
	        				<p>在市委市政府的领导下，巴拉巴拉巴拉巴拉巴拉巴拉</p>
	        				<textarea class="form-control" style="display: none;">
	        				在市委市政府的领导下，巴拉巴拉巴拉巴拉巴拉巴拉
	        				</textarea>
	        			</td>
	        			<td>
	        				<img src="${pageContext.request.contextPath}/images/fy/anding.png"/>
	        				<input class="form-control"  type="file" style="display: none;">
	        			</td>
	        			<td>
							<button type="button"  class="btn btn-default revise" onclick="reviseCall(this)" >修改</button>
							<button type="button"  class="btn btn-default remove" onclick="remove(this)" >删除</button>
							<button type="button" style="display:none"  class="btn btn-default save" onclick="save(this)" >保存</button>
						</td>
					</tr>
        		</tbody>
        	</table>
        </div>
     </div>
   </div>
   <%@ include  file="./template/footer.jsp"%>
   <script type="text/javascript">
   $(function(){
	   $(".sidebar .active").removeClass("active");
	   $(".sidebar #history").addClass("active");
   });
   
   function reviseCall(e){
	   var p = $(e).parents("tr");
	   $(p).find("[type='text']").show();
	   $(p).find("textarea").show();
	   $(p).find("p").hide();
	   $(".revise").hide();
	   $(".remove").hide();
	   $(".save").show();
   }
   function save(e){
	   var p = $(e).parents("tr");
	   $(p).find("[type='text']").hide();
	   $(p).find("textarea").hide();
	   $(p).find("p").show();
	   $(".save").hide();
	   $(".remove").show();
	   $(".revise").show();
   }
   </script>
</body>
</html>
</html>