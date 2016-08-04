$(function(){
    var pagePrev = $(".ja-profile .ja-profile-posts .fa-chevron-left");
    var pageNext = $(".ja-profile .ja-profile-posts .fa-chevron-right");

    var maxProfile = "ja-profile-post-max";
    var hiddenProfile = "ja-profile-post-hidden";

    pagePrev.on("click", function(e){
        handlePageClick(e);

        hiddenPosts().slice(0, 3).show().each(function(idx){
            var post = $(this);
            var duration = 1000;

            slidePost(post, "0px", duration);
        });

        determinePaging();
    });

    pageNext.on("click", function(e){
        handlePageClick(e);

        visiblePosts().slice(0, 3).each(function(idx){
            var post = $(this);
            var distance = -342 * (idx + 1);
            var duration = 1000;

            slidePost(post, distance + "px", duration, function(){
                $(this).hide();
            });
        });

        determinePaging();
    });

    $("body .container .row").on("click", ".ja-post-header a, .ja-post-subject a, .ja-post-abstract a, .ja-post-close", function(e){
        var post = $(this).closest(".ja-post");

        togglePosts(post);
    });

    $("body .container .row").on("click", function(e){
        handleMaximizedPost();
    });

    var handlePageClick = function(e){
        //e.stopPropagation();
        e.preventDefault();

        handleMaximizedPost();
    }

    var handleMaximizedPost = function(){
        var post = $(".ja-profile-post-max");

        if(post.length > 0){
            togglePosts(post);
        }
    }

    var togglePosts = function(post){
        var profile = post.closest(".ja-profile");

        if(post.hasClass("ja-profile-post-max")){
            post.removeClass("ja-profile-post-max");

            profile.find(".ja-post").removeClass(hiddenProfile);
        } else {
            post.addClass("ja-profile-post-max");

            profile.find(".ja-post:not(.ja-profile-post-max)").addClass(hiddenProfile);
        }
    }

    var slidePost = function(post, distance, duration, func){
        post.animate({ left: distance }, duration, func);
    }

    var visiblePosts = function(){
        return retrievePosts().filter(":visible");
    }

    var hiddenPosts = function(){
        return retrievePosts().filter(":hidden");
    }

    var retrievePosts = function(){
        return $(".ja-profile .ja-profile-posts .ja-post");
    }

    var determinePaging = function(){
        if(visiblePosts().length < 3){
            pageNext.toggle();
        }

        if(hiddenPosts().length < 3){
            pagePrev.toggle();
        }
    }

    determinePaging();
})
