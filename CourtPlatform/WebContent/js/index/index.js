$(function() {
	$(".index-btn").hover(function() {
		$(this).removeClass("unhovered").addClass("hovered");
	}, function() {
		$(this).removeClass("hovered").addClass("unhovered");
	});
});