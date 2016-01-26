<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="revealModal" class="reveal-modal" style="font-size:20px;text-align: center;">
     <p style="font-size:20px;text-align: center;">Any content could go in here.</p>
     <a class="close-reveal-modal">&#215;</a>
</div>
<a href="#" data-reveal-id="revealModal" class="revealtrigger" style="display:none">Click Me For A Modal</a>

<script type="text/javascript">
//唤起信息框
function revealCall(content){
	$("#revealModal").html(content);
	$(".modal input").val("");
	$('#revealModal').reveal({
	     animation: 'fadeAndPop',                   //fade, fadeAndPop, none
	     animationspeed: 300,                       //how fast animtions are
	     closeonbackgroundclick: true,              //if you click background will modal close?
	     dismissmodalclass: 'close-reveal-modal'    //the class of a button or element that will close an open modal
	});	
	setTimeout(function(){
		$(".reveal-modal-bg").click();
	}, 2000);
}
</script>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
   
    <script src="${pageContext.request.contextPath}/lib/bootstrap/js/bootstrap.min.js"></script>