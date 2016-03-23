<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ include  file="./template/head.jsp"%>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/kindeditor/themes/default/default.css" />
		<script charset="utf-8" src="${pageContext.request.contextPath}/lib/kindeditor/kindeditor-min.js"></script>
		<script charset="utf-8" src="${pageContext.request.contextPath}/lib/kindeditor/lang/zh_CN.js"></script>
  </head>

<body>
 <%@ include  file="./template/navbar.jsp"%>


    <div class="container-fluid">
      <div class="row">
        <%@ include  file="./template/menu.jsp"%>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 content">
        <h2>编辑法院介绍</h2>
        	<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'link']
				});
				editor.html($(".hide_data").html());
			});
			</script>
			<form>
				<textarea id="fyjs" name="content" style="width:700px;height:200px;visibility:hidden;"></textarea>
				<div class="form-group" style="text-align: right;width:700px;padding:15px">
				<button type="button"  class="btn btn-primary" onclick="save(this)" >保存</button>
				</div>
			</form>
        </div>
     </div>
   </div>
   <div class="hide_data" style="display:none">${description}</div>
   <%@ include  file="./template/footer.jsp"%>
   <script type="text/javascript">
   $(function(){
	   $(".sidebar .active").removeClass("active");
	   $(".sidebar #description").addClass("active");
   });
   
   function save(e){
	   editor.sync();
	   $.ajax(
   			{url:"${pageContext.request.contextPath}/backend/bcjs",
   				type:"post",
   				dataType:"json",
   				data:{"js":$("#fyjs").val()},
   				async:false,
   				success:function(data){
   					if(data == true){
   						revealCall("保存成功！");
   					}else{
   						revealCall("保存失败！");
   					}
   				}
   			}); 
			
	   //$(".test").html($("[name='content']").val());
	   //alert($("[name='content']").val());
   }
   </script>
</body>
</html>
</html>