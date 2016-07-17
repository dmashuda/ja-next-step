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

	function togglePost(post){
		post.toggleClass("ja-post-max").toggleClass("ja-post-min");

		$("html, body").animate({
	        scrollTop: post.offset().top - 60
	    }, 1000);

        post.find(".ja-post-abstract").toggle();
        post.find(".ja-post-summary").toggle();
	}

	function closeMaximizedPost(){
        var mps = $(".ja-post-max");

        mps.removeClass("ja-post-max").addClass("ja-post-min");

        mps.find(".ja-post-abstract").toggle();
        mps.find(".ja-post-summary").toggle();
	}
});