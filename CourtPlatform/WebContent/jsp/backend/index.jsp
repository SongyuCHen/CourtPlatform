<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include  file="./template/head.jsp"%>
    <link href="${pageContext.request.contextPath}/css/backend/moduleMan.css" rel="stylesheet">
    
    <link href="${pageContext.request.contextPath}/lib/dtree/dtree.css" rel="stylesheet">
   
    <script src="${pageContext.request.contextPath}/lib/dtree/dtree.js"></script>
    <script src="${pageContext.request.contextPath}/lib/ajaxfileupload.js"></script>
  </head>

  <body>

    <%@ include  file="./template/navbar.jsp"%>

    <div class="container-fluid">
      <div class="row">
        <%@ include  file="./template/menu.jsp"%>
        <div class="col-sm-3 col-sm-offset-3 col-md-2 col-md-offset-2 tree">
			  <script type="text/javascript">
			  function buildTree(){
		        d = new dTree('d');
		        $.ajax(
		    			{url:"${pageContext.request.contextPath}/backend/gettree",
		    				type:"post",
		    				dataType:"json",
		    				async:false,
		    				success:function(data){
		    					var subModules = data.modelMap.data.subModels;
		    					for(var m in subModules){
		    						var node = d.add(subModules[m].bh,subModules[m].parent,subModules[m].name,subModules[m].c_url,subModules[m].levels,subModules[m].c_img);
		    						//d.addNode(node);
		    					}
		    					
		    					//alert(d.aNodes.length);
		    				}
		    			});    
		        d.add(0,-1,'结点列表');
		       $(".tree")[0].innerHTML=d;
			  }
			  buildTree();
		      </script>
        </div><!-- col-sm-3 -->
        <div class="col-sm-6 col-md-8 main">
          	<div class="content" style="display:none">
          		<form class="form-horizontal">
          		  <div class="form-group" style="display:none">
				    <label for="inputEmail3" class="col-sm-2 control-label">编号</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="BhInput">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">模块名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="moduleInput">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">url</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="urlInput">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-offset-2 col-sm-10" style="text-align:right">
				      <div class="reviseResult" style="display:inline-block;margin-right:10px;"></div>
				      <button type="button" class="btn btn-default removeSub" onclick="removeSub()">删除</button>
				      <button type="button" class="btn btn-default" onclick="reviseInfo()">修改</button>
				      <button type="button" class="btn btn-primary addSub" onclick="addSubCall()" data-toggle="modal" data-target="#myModal">增加子节点</button>
				    </div>
				  </div>
				  <hr style="width:100%;border-color:#eee"/>
					  <div class="form-group" id="updateDiv">
					    <label for="inputPassword3" class="col-sm-2 control-label">上传图片</label>
					    <div class="col-sm-10" style="text-align: left;">
					      <input type="file" class="form-control" id="upload1" name="upload1" style="display: inline-block;width:80%">
						      <button type="button" class="btn btn-default" onclick="ajaxFileUpload()" style="float:right">上传</button>
						  <div style="width:80%;text-align: center;">
						  		<div style="width:100px;height:100px;line-height: 90px;text-align: center;border:1px #999 dashed;margin:10px auto">
						  			<img style="width:90px;height:90px" />
						  			<div id="result"></div>
						  		</div>
						  </div>			
					    </div>
					  </div>
				</form>
          		
          	</div>
        </div>
      </div>
    </div>


<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">增加子节点</h4>
      </div>
      <div class="modal-body">
        	<form class="form-horizontal">
        		  <div class="form-group" style="display:none">
				    <label for="inputEmail3" class="col-sm-2 control-label">父节点</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="parentInputNew">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">模块名称</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="moduleInputNew">
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">url</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" id="urlInputNew">
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
<%@ include  file="./template/footer.jsp"%>
    <script type="text/javascript">
	    $(".sidebar .active").removeClass("active");
	    $(".sidebar #module").addClass("active");
    	var h = document.body.scrollHeight;
    	$(".tree").css("min-height",(h-50)+"px");
    	
    	var ilevel = 1;
    	var bh;
    	var target ;
    	
    	//显示submodel详情
    	function show_sub(name,url,pid,level,id,src,e){
    		$("#BhInput").val(id);
    		$("#moduleInput").val(name);
    		$("#urlInput").val(url);
    		if(level == 3){
    			$(".addSub").hide();
    			$("#updateDiv").show();
    		}else{
    			$(".addSub").show();
    			$("#updateDiv").hide();
    		}
    		
    		if(level == 1){
    			$(".removeSub").hide();
    		}else{
    			$(".removeSub").show();
    		}
    		ilevel = level;
    		target = e;
    		bh = id;
    		$("#result").html("");
    		$("#reviseResult").html("");
    		$(".main .content").show();
    		$(".main .content img").attr("src","${pageContext.request.contextPath}/images/icon/"+src);
    	}
    	function addSubCall(){
    		$("#parentInputNew").val($("#BhInput").val());
    		if(ilevel != 2){
    			$("#addUpdateImg").hide();
    		}else{
    			$("#addUpdateImg").show();
    		}
    	}
    	
    	//添加子节点，level=2不用传图，level=3需要传图
    	function addSub(){
    		if(ilevel != 2){
    			if($("#parentInputNew").val() == ""
    				|| $("#moduleInputNew").val() == "" || $("#urlInputNew").val() == ""){
    				$(".modal-footer span").html("请将数据填写完整");
    			return;
    			}
    			var parent = $("#parentInputNew").val();
				var moduleName = $("#moduleInputNew").val();
				var url = $("#urlInputNew").val();
				
				 $.ajax(
	    			{url:"${pageContext.request.contextPath}/backend/savewithoutimg",
	    				type:"post",
	    				dataType:"json",
	    				data:{"name":moduleName,"url":url,"parent":parent},
	    				async:false,
	    				success:function(data){
	    					//var subModules = data.modelMap.data.subModels;
	    					console.log(data.model.status);
	    					$(".modal .close").click();
	    					if(data.model.status==true){
	    						$(target).html(name);
	    						buildTree();
	    						//$("#reviseResult").html("修改成功！");
	    						revealCall("添加成功！");
	    					}else{
	    						//$("#reviseResult").html("修改失败！");
	    						revealCall("添加失败！");
	    					}
	    				}
	    			}); 
				
				
				
				
				
    		}else{
	    		if($("#uploadNew").val() == "" || $("#parentInputNew").val() == ""
	    				|| $("#moduleInputNew").val() == "" || $("#urlInputNew").val() == ""){
	    			$(".modal-footer span").html("请将数据填写完整");
	    			return;
	    		}
				var info = $("#uploadNew").val();
				var parent = $("#parentInputNew").val();
				var moduleName = $("#moduleInputNew").val();
				var url = $("#urlInputNew").val();
	    		var arr=info.split('\\');//注split可以用字符或字符串分割 
	    		var my=arr[arr.length-1];//这就是要取得的图片名称 
	    		
	    		$.ajaxFileUpload({
	    			//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
	    			url:"${pageContext.request.contextPath}/uploadApkNew?p="+parent+"&n="+encodeURI(moduleName)+"&u="+url,
	//    	 		url:basePath + "uploadApk.do?apkIntroduce="+apkIntroduce,
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
	    					$(".main .content img").attr("src","${pageContext.request.contextPath}/images/icon/"+my);
	    					buildTree();
	    					revealCall("添加成功！");
	    				}else if ( dataset.status == "parm_is_empty"){
	    					revealCall("没有选择图片！");
	    				}else {
	    					revealCall("添加失败！");
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
	    					$(".main .content img").attr("src","${pageContext.request.contextPath}/images/icon/"+my);
	    					buildTree();
	    					revealCall("添加成功！");
	    				}else if ( dataset.status == "empty"){
	    					revealCall("没有选择图片！");
	    				}else {
	    					revealCall("添加失败！");
	    				}
	    				console.log(e);
	    				console.log(data);
	    				//$('#result').html('APK上传失败，请重试！！');
	    			}
	    		});
    		}
    	}
    	
    	//修改图片
    	function ajaxFileUpload(){
    		//获取软件更新详情
    		//var apkIntroduce = $("#apkInfo").val();
    		var info = $("#upload1").val();
    		
    		var arr=info.split('\\');//注split可以用字符或字符串分割 
    		var my=arr[arr.length-1];//这就是要取得的图片名称 
    		console.log(my);
    		//开始上传文件时显示一个图片,文件上传完成将图片隐藏
    		//$("#loading").ajaxStart(function(){$(this).show();}).ajaxComplete(function(){$(this).hide();});
    		//执行上传文件操作的函数，使用encodeURI方法，防止传输中文字符的时候出现乱码
    		//var uploadUrl = encodeURI(encodeURI(basePath + "uploadApk.do"));
    		$.ajaxFileUpload({
    			//处理文件上传操作的服务器端地址(可以传参数,已亲测可用)
    			url:"${pageContext.request.contextPath}/uploadApk?bh="+$("#BhInput").val(),
//    	 		url:basePath + "uploadApk.do?apkIntroduce="+apkIntroduce,
    			secureuri:false,                       //是否启用安全提交,默认为false 
    			fileElementId:'upload1',           //文件选择框的id属性
    			dataType:'text',                   //服务器返回的格式,可以是json或xml等
    			success:function(data, status){        //服务器响应成功时的处理函数
    				data = data.replace("<PRE>", '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre>text</pre>前后缀
    				data = data.replace("</PRE>", '');
    				data = data.replace("<pre>", '');
    				data = data.replace("</pre>", ''); //本例中设定上传文件完毕后,服务端会返回给前台[0`filepath]
    				
    				
    				var dataset = $.parseJSON(data);
    				console.log(data);
    				if(dataset.status == "ok"){
    					$(".main .content img").attr("src","${pageContext.request.contextPath}/images/icon/"+my);
    					revealCall("上传成功！");
    				}else if ( dataset.status == "parm_is_empty"){
    					revealCall("没有选择图片！");
    				}else {
    					revealCall("上传失败！");
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
    				if(dataset.status == "ok"){
    					$(".main .content img").attr("src","${pageContext.request.contextPath}/images/icon/"+my);
    					revealCall("上传成功！");
    				}else if ( dataset.status == "empty"){
    					revealCall("没有选择图片！");
    				}else {
    					revealCall("上传失败！");
    				}
    				console.log(e);
    				console.log(data);
    				//$('#result').html('APK上传失败，请重试！！');
    			}
    		});
    	}
    	
    	//修改信息
    	function reviseInfo(){
    		var name = $("#moduleInput").val();
    		var url = $("#urlInput").val();
    		var bh = $("#BhInput").val();
    		if(name!=null && url!=null){
    		    $.ajax(
		    			{url:"${pageContext.request.contextPath}/backend/reviseinfo",
		    				type:"post",
		    				dataType:"json",
		    				data:{"name":name,"url":url,"bh":bh},
		    				async:false,
		    				success:function(data){
		    					//var subModules = data.modelMap.data.subModels;
		    					console.log(data.model.status);
		    					if(data.model.status==true){
		    						$(target).html(name);
		    						//$("#reviseResult").html("修改成功！");
		    						buildTree();	
		    						revealCall("修改成功！");
		    					}else{
		    						//$("#reviseResult").html("修改失败！");
		    						revealCall("修改失败！");
		    					}
		    				}
		    			}); 
    		}
    	}
    	
    	
    	function removeSub(){
    		$.ajax(
    			{url:"${pageContext.request.contextPath}/backend/removeSub",
    				type:"post",
    				dataType:"json",
    				data:{"bh":bh},
    				async:false,
    				success:function(data){
    					//var subModules = data.modelMap.data.subModels;
    					console.log(data.model.status);
    					if(data.model.status==true){
    						$(target).html(name);
    						//$("#reviseResult").html("修改成功！");
    						/* $($(target).parent()).remove(); */
    						$(".main .content").hide();
    						
    						revealCall("删除成功！");
    						
    						buildTree();
    					}else{
    						//$("#reviseResult").html("修改失败！");
    						revealCall("删除失败！");
    					}
    				}
    			}); 
    	}
    	
    	</script>
  </body>
</html>
