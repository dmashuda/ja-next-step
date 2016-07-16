$(function(){
	$("body .container .row").on("click", ".ja-post-header, .ja-post-subject, .ja-post-abstract, .ja-post-close", function(e){
		var post = $(this).closest(".ja-post-min, .ja-post-max");

		togglePost(post);
	});

	$("body .container .row").on("click", ".ja-post-close", function(e){
		closeMaximizedPost();
	});

	$("body .container .row").on("click", ".ja-post-min, .ja-post-max", function(e){
		e.stopPropagation();
	});

	$("body .container .row").on("click", function(e){
		closeMaximizedPost();
	});

	var body = $("body .container .row");
	var post = $(".ja-post-min");

	post.attr("id", "-1");

	for(var i = 0;i < 200; i++){
		var clone = post.clone();

		clone.attr("id", i);

		body.append(clone);
	}

	function togglePost(post){
		var postId = post.attr("id");

		post.toggleClass("ja-post-max").toggleClass("ja-post-min");

		$("html, body").animate({
	        scrollTop: $("#" + postId).offset().top - 60
	    }, 1000);
	}

	function closeMaximizedPost(){
		$(".ja-post-max").removeClass("ja-post-max").addClass("ja-post-min");
	}
});