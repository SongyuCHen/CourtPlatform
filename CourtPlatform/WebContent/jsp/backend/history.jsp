<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
	<%@ include  file="./template/head.jsp"%>
	<link href="${pageContext.request.contextPath}/css/backend/fylsMan.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laydate/laydate.js"></script>
	
	<link href="${pageContext.request.contextPath}/lib/datatables/media/css/jquery.dataTables.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/media/js/jquery.dataTables.min.js"></script>
  
  	
	<link href="${pageContext.request.contextPath}/lib/datatables/media/css/dataTables.jqueryui.min.css" rel="stylesheet">
	<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/media/js/dataTables.jqueryui.min.js"></script>
  	    <script src="${pageContext.request.contextPath}/lib/ajaxfileupload.js"></script>
  </head>

<body>
 <%@ include  file="./template/navbar.jsp"%>


    <div class="container-fluid">
      <div class="row">
        <%@ include  file="./template/menu.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 content">
        <h2 style="display:inline-block">编辑法院历史</h2>
        <div class="btn btn-primary" style="float:right;margin:20px 5% 0 0" data-toggle="modal" data-target="#myModal">新建</div>
        <hr />
        	<table class="table table-striped" id="history_table">
        		<thead>
        			<tr>
	        			<th>#</th>
	        			<th>标题</th>
	        			<th>时间</th>
	        			<th>内容</th>
	        			<th>图片(修改图片请单独上传)</th>
	        			<th>操作</th>
        			</tr>
        		</thead>
        		<tbody>
        		<c:forEach items="${historys}" var="his" varStatus="status"> 
        			<tr id="history${his.bh}">
	        			<td>${status.index+1}</td>
	        			<td>
	        				<p id="titleP${his.bh}">${his.title}</p>
	        				<input class="form-control titleInput${his.bh}"  type="text" value="${his.title}" style="display: none;">
	        			</td>
	        			<td>
	        				<p id="timeP${his.bh}"><c:out value="${fn:substring(his.time,0,10)}" /></p>
	        				<input class="form-control timeInput${his.bh}" onclick="laydate()"  type="text" value="<c:out value="${fn:substring(his.time,0,10)}" />  " style="display: none;">
	        			</td>
	        			<td>
	        				<p id="contentP${his.bh}">${his.content }</p>
	        				<textarea class="form-control contentInput${his.bh}" style="display: none;resize:none;height:200px">${his.content }
	        				</textarea>
	        			</td>
	        			<td style="text-align:center">
	        				<img src="${pageContext.request.contextPath}/images/history/${his.c_img }" onclick="uploadCall(this)" id="historyImg${his.bh}"/>
	        				<form class="" style="display: none;margin-top:5px">
							  <div class="form-group">
							    <input class="form-control"  type="file" id="uploadRevise${his.bh}" name="uploadRevise">
							  </div>
	        					<button type="button"  class="btn btn-default upload" onclick="upload(${his.bh})" style="float:right;">上传</button>
							  </form>
	        				
	        			</td>
	        			<td>
							<button type="button"  class="btn btn-default revise${his.bh}" onclick="reviseCall(this,${his.bh})" >修改</button>
							<button type="button"  class="btn btn-default remove${his.bh}" onclick="removeCall(this,${his.bh})" >删除</button>
							<button type="button" style="display:none"  class="btn btn-default save${his.bh}" onclick="saveCall(this,${his.bh})" >保存</button>
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
        <h4 class="modal-title" id="myModalLabel">增加历史节点</h4>
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
				   <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">内容</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="contentInputNew">
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
	   $(".sidebar #history").addClass("active");
		    $('#history_table').dataTable( {
		        "aaSorting": [
		            [ 2, "desc" ]
		        ],
	                "bPaginate": false, //开关，是否显示分页器
	                "bInfo": false, //开关，是否显示表格的一些信息
	                "bFilter": false, //开关，是否启用客户端过滤器
	                "bJQueryUI": true, //开关，是否启用JQueryUI风格
	                "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 4,5 ] }]  
		    } );
   });
   
   function reviseCall(e,bh){
	   var p = $(e).parents("tr");
	   $(p).find("[type='text']").show();
	   $(p).find("textarea").show();
	   $(p).find("p").hide();
	   $(".revise"+bh).hide();
	   $(".remove"+bh).hide();
	   $(".save"+bh).show();
	   $('#history_table').dataTable().fnSetColumnVis( 4, false);
   }
   function saveCall(e,bh){
	   if($("#titleInput"+bh).val() == "" || $("#timeInput"+bh).val() == ""
			|| $("#contentInput"+bh).val() == ""){
		revealCall("请填写完整！");
		return;
	}
	   $.ajax({
		   url:"${pageContext.request.contextPath}/backend/revisehistory",
		   type:"post",
		   dataType:"json",
		   data:{
			   "bh":bh,
			   "title":$(".titleInput"+bh).val(),
				"time":$(".timeInput"+bh).val(),
				"content":$(".contentInput"+bh).val(),
		   },
		   async:false,
				success:function(data){
					var result = data.model.status;
					if(result){
						$("#titleP"+bh).html($(".titleInput"+bh).val());
						$("#timeP"+bh).html($(".timeInput"+bh).val());
						$("#contentP"+bh).html($(".contentInput"+bh).val());
					   var p = $(e).parents("tr");
					   $(p).find("[type='text']").hide();
					   $(p).find("textarea").hide();
					   $(p).find("p").show();
					   $(".save"+bh).hide();
					   $(".remove"+bh).show();
					   $(".revise"+bh).show();
					   $('#history_table').dataTable().fnSetColumnVis( 4, true);
					   revealCall("保存成功！");
					}else{
						revealCall("保存失败！");
					}
				}
		   
	   });
	  
   }
   function removeCall(e,bh){
	   //删除信息
	   $.ajax(
  			{url:"${pageContext.request.contextPath}/backend/deletehistory",
  				type:"post",
  				dataType:"json",
  				data:{
  					"bh":bh
  				},
  				async:false,
  				success:function(data){
  					var result = data.model.status;
  					if(result){
  					   var table = $('#history_table').DataTable();
  					   var p = $(e).parents('tr');
  					   table.row($(p)).remove().draw();
  					   revealCall("删除成功！");
  					}else{
  						revealCall("删除失败！");
  					}
  				}
  			});	 
	   
   }
   
   function uploadCall(e){
	   $(e).siblings("form").slideDown();
   }
   
   //增加历史节点
   function addSub(){
	   if($("#titleInputNew").val() == "" || $("#timeInputNew").val() == ""
			|| $("#contentInputNew").val() == "" || $("#uploadNew").val() == ""){
		$(".modal-footer span").html("请将数据填写完整");
		return;
		}
	   var _isSuccess1 = false;
	   var _isSuccess2 = false;
	   var _tmpId = 0;
	   //保存信息
	   $.ajax(
  			{url:"${pageContext.request.contextPath}/backend/savehistory",
  				type:"post",
  				dataType:"json",
  				data:{
  					"title":$("#titleInputNew").val(),
  					"time":$("#timeInputNew").val(),
  					"content":$("#contentInputNew").val(),
  				},
  				async:false,
  				success:function(data){
  					_tmpId = data.model.status;
  					_isSuccess1 = _tmpId>0;
  				}
  			});	   
	   //上传图片
		$.ajaxFileUpload({
			url:"${pageContext.request.contextPath}/backend/uploadhistory?bh="+_tmpId,
			secureuri:false,                       //是否启用安全提交,默认为false 
			fileElementId:'uploadNew',           //文件选择框的id属性
			dataType:'text',                   //服务器返回的格式,可以是json或xml等
			success:function(data, status){        //服务器响应成功时的处理函数
				data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
				data = data.replace("</PRE>", '');
				data = data.replace("<pre>", '');
				data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
				
				
				var dataset = $.parseJSON(data);
				console.log(data);
				$(".modal .close").click();
				if(dataset.status == "ok"){
					_isSuccess2 = true;
					if(_isSuccess1 && _isSuccess2){
						   revealCall("添加成功！");
						   history.go(0);
					   }
				}else if ( dataset.status == "parm_is_empty"){
				}else {
				}
			},
			error:function(data, status, e){ //服务器响应失败时的处理函数
				data = data.responseText; 
				data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
				data = data.replace("</PRE>", '');
				data = data.replace("<pre>", '');
				data = data.replace("<pre style=\"word-wrap: break-word; white-space: pre-wrap;\">", '');
				data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
				
				var dataset = $.parseJSON(data);
				console.log(data);
				$(".modal .close").click();
				if(dataset.status == "ok"){
					_isSuccess2 = true;
					if(_isSuccess1 && _isSuccess2){
						   revealCall("添加成功！");
						   history.go(0);
					   }
				}else if ( dataset.status == "empty"){
				}else {
				}
				console.log(data);
			}
		});
	   
	   
   }
   
   
   function upload(bh){
	   var info = $("#uploadRevise"+bh).val();
		var arr=info.split('\\');//注split可以用字符或字符串分割 
		var my=arr[arr.length-1];//这就是要取得的图片名称 
	 //上传图片
		$.ajaxFileUpload({
			url:"${pageContext.request.contextPath}/backend/uploadhistory2?bh="+bh,
			secureuri:false,                       //是否启用安全提交,默认为false 
			fileElementId:'uploadRevise'+bh,           //文件选择框的id属性
			dataType:'text',                   //服务器返回的格式,可以是json或xml等
			success:function(data, status){        //服务器响应成功时的处理函数
				data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
				data = data.replace("</PRE>", '');
				data = data.replace("<pre>", '');
				data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
				
				
				var dataset = $.parseJSON(data);
				if(dataset.status == "ok"){
				   revealCall("修改成功！");
				   $("#historyImg"+bh).attr("src","${pageContext.request.contextPath}/images/history/"+my);
				}else if ( dataset.status == "parm_is_empty"){
					revealCall("图片为空！");
				}else {
					revealCall("修改为空！");
				}
			},
			error:function(data, status, e){ //服务器响应失败时的处理函数
				data = data.responseText; 
				data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
				data = data.replace("</PRE>", '');
				data = data.replace("<pre>", '');
				data = data.replace("<pre style=\"word-wrap: break-word; white-space: pre-wrap;\">", '');
				data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
				
				var dataset = $.parseJSON(data);
				if(dataset.status == "ok"){
					   revealCall("修改成功！");
					   $("#historyImg"+bh).attr("src","${pageContext.request.contextPath}/images/history/"+my);
					}else if ( dataset.status == "parm_is_empty"){
						revealCall("图片为空！");
					}else {
						revealCall("修改为空！");
					}
			}
		});
	   
   }
   
   </script>
   <%@ include  file="./template/footer.jsp"%>
</body>
</html>
</html>