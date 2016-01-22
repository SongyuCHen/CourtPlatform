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
        	<table class="table table-striped">
        		<thead>
        			<tr>
	        			<th>#</th>
	        			<th>名称</th>
	        			<th>ip</th>
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
							<button type="button"  class="btn btn-default" onclick="reviseCall(this)" >修改</button>
							<button type="button"  class="btn btn-default" onclick="save(this)" >保存</button>
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
	   $(".sidebar #sjrb").addClass("active");
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