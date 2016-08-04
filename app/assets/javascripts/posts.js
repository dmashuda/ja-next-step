$(function(){
	$("body .container .row").on("click", ".ja-post-header a, .ja-post-subject a, .ja-post-abstract a, .ja-post-close", function(e){
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

    $("body .container .row").on("click", ".ja-post-info.ja-post-icon-link", function(e){
        var stakeholderId = $(this).attr("stakeholderId");
        var url = "/stakeholders/" + stakeholderId + "/profile.json";
        var profileTemplate = $(".ja-profile.ja-profile-template");
        var modal = $("<div class='ja-modal'></div>");

        $.getJSON(url, function(data){
            var clone = profileTemplate.clone();

            clone.removeClass("ja-profile-template ja-profile-hide");

            clone.find(".ja-profile-banner").attr("src", data.banner);
            clone.find(".ja-profile-logo").attr("src", data.logo);
            clone.find(".ja-profile-body-left-street").text(data.street);
            clone.find(".ja-profile-body-left-city").text(data.city + ", " + data.state + " " + data.zip);
            clone.find(".ja-profile-body-left-phone").text(data.phone);
            clone.find(".ja-profile-body-left-website")
                .text(data.website_url)
                .attr("href", data.website_url);
            clone.find(".ja-profile-body-right-about-us").text(data.about_us);

            $("body").append(modal.append(clone));
        });
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