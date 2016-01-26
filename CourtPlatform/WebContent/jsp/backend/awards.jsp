<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include  file="./template/head.jsp"%>
	<link href="${pageContext.request.contextPath}/css/backend/fylsMan.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laydate/laydate.js"></script>
	
	<link href="${pageContext.request.contextPath}/lib/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/media/js/jquery.dataTables.min.js"></script>
  
  	
	<link href="${pageContext.request.contextPath}/lib/datatables/media/css/dataTables.jqueryui.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/media/js/dataTables.jqueryui.min.js"></script>
  </head>

<body>
 <%@ include  file="./template/navbar.jsp"%>


    <div class="container-fluid">
      <div class="row">
        <%@ include  file="./template/menu.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 content">
        <h2 style="display:inline-block">编辑院史荣誉</h2>
        <div class="btn btn-primary" style="float:right;margin:20px 5% 0 0" data-toggle="modal" data-target="#myModal">新建</div>
        <hr />
        	<table class="table table-striped" id="history_table" style="text-align: center;">
        		<thead>
        			<tr>
        				<th></th>
	        			<th>#</th>
	        			<th>标题</th>
	        			<th>时间</th>
	        			<th>图片(修改图片请单独上传)</th>
	        			<th>操作</th>
        			</tr>
        		</thead>
        		<tbody>
        			<tr role="row" class="odd">
        				<td>
        					<div class="op"><img width="16" height="16" title="置顶" alt="置顶" class="up" src="${pageContext.request.contextPath}/images/arrow_top.png"></div>
        					<div class="op"><img width="16" height="16" title="上移" alt="上移"  class="down"  src="${pageContext.request.contextPath}/images/arrow_up.png"></div>
        				</td>
	        			<td>1</td>
	        			<td>
	        				<p>2014-2015年度体坛风云人物</p>
	        				<input class="form-control"  type="text" value="建院" style="display: none;">
	        			</td>
	        			<td>
	        				<p>2015/2/3</p>
	        				<input class="form-control" onclick="laydate()"  type="text" value="2015-2-3" style="display: none;">
	        			</td>
	        			<td style="text-align:center">
	        				<img src="${pageContext.request.contextPath}/images/fy/anding.png" onclick="uploadCall(this)"/>
	        				<form class="" style="display: none;margin-top:5px">
							  <div class="form-group">
							    <input class="form-control"  type="file">
							  </div>
	        					<button type="button"  class="btn btn-default upload" onclick="upload()" style="float:right;">上传</button>
							  </form>
	        				
	        			</td>
	        			<td>
							<button type="button"  class="btn btn-default revise1" onclick="reviseCall(this)" >修改</button>
							<button type="button"  class="btn btn-default remove1" onclick="removeCall(this)" >删除</button>
							<button type="button" style="display:none"  class="btn btn-default save1" onclick="saveCall(this)" >保存</button>
						</td>
					</tr>
					
					
					<tr role="row" class="odd">
        				<td>
        					<div class="op"><img width="16" height="16" title="置顶" alt="置顶" class="up" src="${pageContext.request.contextPath}/images/arrow_top.png"></div>
        					<div class="op"><img width="16" height="16" title="上移" alt="上移" class="down" src="${pageContext.request.contextPath}/images/arrow_up.png"></div>
        				</td>
	        			<td>2</td>
	        			<td>
	        				<p>2014-2015年度体坛风云人物</p>
	        				<input class="form-control"  type="text" value="建院" style="display: none;">
	        			</td>
	        			<td>
	        				<p>2015/2/3</p>
	        				<input class="form-control" onclick="laydate()"  type="text" value="2015-2-3" style="display: none;">
	        			</td>
	        			<td style="text-align:center">
	        				<img src="${pageContext.request.contextPath}/images/fy/anding.png" onclick="uploadCall(this)"/>
	        				<form class="" style="display: none;margin-top:5px">
							  <div class="form-group">
							    <input class="form-control"  type="file">
							  </div>
	        					<button type="button"  class="btn btn-default upload" onclick="upload()" style="float:right;">上传</button>
							  </form>
	        				
	        			</td>
	        			<td>
							<button type="button"  class="btn btn-default revise1" onclick="reviseCall(this)" >修改</button>
							<button type="button"  class="btn btn-default remove1" onclick="removeCall(this)" >删除</button>
							<button type="button" style="display:none"  class="btn btn-default save1" onclick="saveCall(this)" >保存</button>
						</td>
					</tr>
					
					
					
					<tr role="row" class="odd">
        				<td>
        					<div class="op"><img width="16" height="16" title="置顶" alt="置顶" class="up" src="${pageContext.request.contextPath}/images/arrow_top.png"></div>
        					<div class="op"><img width="16" height="16" title="上移" alt="上移" class="down" src="${pageContext.request.contextPath}/images/arrow_up.png"></div>
        				</td>
	        			<td>3</td>
	        			<td>
	        				<p>2014-2015年度体坛风云人物</p>
	        				<input class="form-control"  type="text" value="建院" style="display: none;">
	        			</td>
	        			<td>
	        				<p>2015/2/3</p>
	        				<input class="form-control" onclick="laydate()"  type="text" value="2015-2-3" style="display: none;">
	        			</td>
	        			<td style="text-align:center">
	        				<img src="${pageContext.request.contextPath}/images/fy/anding.png" onclick="uploadCall(this)"/>
	        				<form class="" style="display: none;margin-top:5px">
							  <div class="form-group">
							    <input class="form-control"  type="file">
							  </div>
	        					<button type="button"  class="btn btn-default upload" onclick="upload()" style="float:right;">上传</button>
							  </form>
	        				
	        			</td>
	        			<td>
							<button type="button"  class="btn btn-default revise1" onclick="reviseCall(this)" >修改</button>
							<button type="button"  class="btn btn-default remove1" onclick="removeCall(this)" >删除</button>
							<button type="button" style="display:none"  class="btn btn-default save1" onclick="saveCall(this)" >保存</button>
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
        <h4 class="modal-title" id="myModalLabel">增加节点</h4>
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
				    <label for="inputPassword3" class="col-sm-2 control-label">时间</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="timeInputNew" onclick="laydate()" >
				    </div>
				  </div>
				  <div class="form-group" id="addUpdateImg">
				    <label for="inputPassword3" class="col-sm-2 control-label">上传图片</label>
				    <div class="col-sm-10">
				      <input type="file" class="form-control" id="uploadNew" name="uploadNew">
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
	   $(".sidebar #awards").addClass("active");
		    $('#history_table').dataTable( {
		        "aaSorting": [
		            [ 2, "desc" ]
		        ],
	                "bPaginate": false, //开关，是否显示分页器
	                "bInfo": false, //开关，是否显示表格的一些信息
	                "bFilter": false, //开关，是否启用客户端过滤器
	                "bJQueryUI": true, //开关，是否启用JQueryUI风格
	                "aoColumnDefs": [ { "aTargets": [0,1,2,3,4,5 ] }] ,
	                "ordering":false
		    } );
   });
   
   function reviseCall(e){
	   var p = $(e).parents("tr");
	   $(p).find("[type='text']").show();
	   $(p).find("textarea").show();
	   $(p).find("p").hide();
	   $(".revise1").hide();
	   $(".remove1").hide();
	   $(".save1").show();
	   $('#history_table').dataTable().fnSetColumnVis( 4, false);
   }
   function saveCall(e){
	   var p = $(e).parents("tr");
	   $(p).find("[type='text']").hide();
	   $(p).find("textarea").hide();
	   $(p).find("p").show();
	   $(".save1").hide();
	   $(".remove1").show();
	   $(".revise1").show();
	   $('#history_table').dataTable().fnSetColumnVis( 4, true);
	   revealCall("保存成功！");
   }
   function removeCall(e){
	   var table = $('#history_table').DataTable();
	   var p = $(e).parents('tr');
	   table.row($(p)).remove().draw();
	   revealCall("删除成功！");
   }
   
   function uploadCall(e){
	   $(e).siblings("form").slideDown();
   }
   
   function moveTop(e){
	   
   }
   
   function moveUp(e){
	   
   }

   

   // 初始化上升按钮  
   $('#history_table tbody').on('click', '.up', function(e) {  
       e.preventDefault();  
       var table = $('#history_table').DataTable();  
       var index = table.row($(this).parents('tr')).index();
       if ((index - 1) >= 0) {  
           var data = table.data();  
	       console.log(".data:"+data);
           table.clear();  
           data.splice((index - 1), 0, data.splice(index, 1)[0]);  
           table.rows.add(data).draw();  
       } else {  
           alert("亲，已经到顶了");  
       }  
 
   });  
 
   // 初始化下降按钮  
   $('#history_table tbody').on('click', '.down', function(e) {  
       e.preventDefault();  
 
       var table = $('#history_table').DataTable();  
       var index = table.row($(this).parents('tr')).index();
       var max = table.rows().data().length;  
       console.log("max:"+max+".index:"+index);
       if ((index + 1) < max) {  
           var data = table.data();  
           table.clear();  
           data.splice((index + 1), 0, data.splice(index, 1)[0]);  
           table.rows.add(data).draw();  
       } else {  
           alert("亲，已经到底了");  
       }  
   });  
   

   </script>
   <%@ include  file="./template/footer.jsp"%>
</body>
</html>
</html>