$(function(){
    var profileNotTemplateSelector = ".ja-profile:not(.ja-profile-template)";
    var profilePagingNextSelector = ".fa-chevron-right";
    var profilePagingPrevSelector = ".fa-chevron-left";
    var maxProfileSelector = "ja-profile-post-max";
    var hiddenProfileSelector = "ja-profile-post-hidden";

    var modalClass = "ja-modal";

	$("body")
        .on("click", ".ja-post-header a, .ja-post-subject a, .ja-post-abstract a, .ja-post-close", function(e){
            e.preventDefault();

            var post = $(this).closest(".ja-post-min, .ja-post-max");

            togglePost(post);
        })
        .on("click", ".ja-post-close", function(e){
            closeMaximizedPost();
        })
        .on("click", ".ja-post-min, .ja-post-max", function(e){
		    e.stopPropagation();
	    })
        .on("click", function(e){
            closeMaximizedPost();
        })
        .on("click", ".ja-post-info.ja-post-icon-link", function(e){
            var stakeholderId = $(this).attr("stakeholderId");

            ajaxShowProfile(stakeholderId);
        })
        .on("click", "." + modalClass + ", .ja-profile .ja-profile-close", function(e){
            var ele = $(this);

            if(!ele.hasClass(modalClass)){
                ele = ele.closest("." + modalClass);
            }

            ele.remove();
        })
        .on("click", profileNotTemplateSelector, function(e){
            e.stopPropagation();
        })
        .on("click", profilePagingPrevSelector, function(e){
            handleProfilePageClick(e);

            var sliceCount = 3;

            hiddenProfilePosts().slice(-sliceCount).show().each(function(idx){
                var post = $(this);
                var duration = 1000;

                post.show();

                slideProiflePost(post, "0px", duration);

                if((idx+1) >= sliceCount){
                    determineProfilePaging();
                }
            });

            determineProfilePaging();
        })
        .on("click", profilePagingNextSelector, function(e){
            handleProfilePageClick(e);

            var sliceCount = 3;

            visibleProfilePosts().slice(0, sliceCount).each(function(idx){
                var post = $(this);
                var distance = -342 * (idx + 1);
                var duration = 1000;

                slideProiflePost(post, distance + "px", duration, function(){
                    $(this).hide();

                    if((idx+1) >= sliceCount){
                        determineProfilePaging();
                    }
                });
            });
        })
        .on("click", function(e){
            handleProfileMaximizedPost();
        })
    ;

    $(".ja-post-adv-search-tab")
        .on("click", function(e){
            e.preventDefault();

            var tab = $(this);
            var icon = tab.find("i");
            var parent = tab.parent();

            if(icon.hasClass("fa-search-plus")){
                parent.css({"right": "0"});

                icon.removeClass("fa-search-plus");
                icon.addClass("fa-search-minus");
            } else {
                parent.removeAttr("style");

                icon.removeClass("fa-search-minus");
                icon.addClass("fa-search-plus");
            }
        })
    ;





    function handleProfilePageClick(e){
        e.stopPropagation();
        e.preventDefault();

        handleProfileMaximizedPost();
    }

    function handleProfileMaximizedPost(){
        var post = $(".ja-profile-post-max");

        if(post.length > 0){
            togglePost(post);
        }
    }

    function slideProiflePost(post, distance, duration, func){
        post.animate({ left: distance }, duration, func);
    }

    function visibleProfilePosts(){
        return retrieveProfilePosts().filter(":visible");
    }

    function hiddenProfilePosts(){
        return retrieveProfilePosts().filter(":hidden");
    }

    function retrieveProfilePosts(){
        return $(profileNotTemplateSelector + " .ja-profile-posts .ja-post");
    }

    function determineProfilePaging(){
        var profilePageNext = $(profileNotTemplateSelector + " " + profilePagingNextSelector);
        var profilePagePrev = $(profileNotTemplateSelector + " " + profilePagingPrevSelector);

        if(visibleProfilePosts().length < 3){
            profilePageNext.hide();
        } else {
            profilePageNext.show();
        }

        if(hiddenProfilePosts().length < 3){
            profilePagePrev.hide();
        } else {
            profilePagePrev.show();
        }
    }

    function ajaxShowProfile(stakeholderId){
        var url = "/stakeholders/" + stakeholderId + "/profile.json";
        var template = $(".ja-profile.ja-profile-template");
        var modal = $("<div class='" + modalClass + "'></div>");

        $.getJSON(url, function(data){
            var clone = template.clone();

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
            clone.find(".ja-profile-body-right-contact-us a").attr("href", "mailto:" + data.email);

            var instagram = clone.find(".fa-instagram").closest("a");
            var facebook = clone.find(".fa-facebook").closest("a");
            var twitter = clone.find(".fa-twitter").closest("a");
            var youtube = clone.find(".fa-youtube").closest("a");

            if(data.instagram_url){
                instagram.attr("href", data.instagram_url);
            } else {
                instagram.hide();
            }
            if(data.facebook_url){
                facebook.attr("href", data.facebook_url);
            } else {
                facebook.hide();
            }
            if(data.twitter_url){
                twitter.attr("href", data.twitter_url);
            } else {
                twitter.hide();
            }
            if(data.youtube_url){
                youtube.attr("href", data.youtube_url);
            } else {
                youtube.hide();
            }

            ajaxRetrieveProfilePosts(stakeholderId);

            $("body").append(modal.append(clone));
        });
    }

    function ajaxRetrieveProfilePosts(stakeholderId){
        var url = "/posts.json?stakeholder_id=" + stakeholderId;
        var template = $(".ja-post:first").clone();

        clearPostTemplate(template);

        $.getJSON(url, function(data){
            var postsDiv = $(".ja-profile .ja-profile-post-list");

            for(var i = 0;i < data.length; i++){
                var postRec = data[i];
                var clone = template.clone();

                clone.find(".ja-post-header-title").text(postRec.stakeholder.name);
                clone.find(".ja-post-logo-img").attr("src", postRec.profile.logo);
                clone.find(".ja-post-img").attr("src", postRec.photo);
                clone.find(".ja-post-info.ja-post-icon-link").attr("stakeholderId", stakeholderId);
                clone.find(".ja-post-contact.ja-post-icon-link").attr("href", "mailto:"+ postRec.contact_email + "?body=" + postRec.email_body + "&subject=" + postRec.email_subject);
                clone.find(".ja-post-subject a").text(postRec.subject);
                clone.find(".ja-post-abstract a").text(postRec.abstract);
                clone.find(".ja-post-summary").text(postRec.body);

                postsDiv.append(clone);
            }

            determineProfilePaging();
        });
    }

    function clearPostTemplate(template){
        template.find(".ja-post-header-title").text("");
        template.find(".ja-post-logo-img").attr("src", "");
        template.find(".ja-post-img").attr("src", "");
        template.find(".ja-post-info.ja-post-icon-link").remove(); // remove since we're already viewing the profile
        template.find(".ja-post-contact.ja-post-icon-link").attr("href", "");
        template.find(".ja-post-subject a").text("");
        template.find(".ja-post-abstract a").text("");
        template.find(".ja-post-summary").text("");
    }

	function togglePost(post){
	    var profile = post.parents(".ja-profile");

        if(post.hasClass("ja-post-min")){
            var existingMaxdPost = $(".ja-post-max");

            if(existingMaxdPost.length == 1){
                togglePostAttrs(existingMaxdPost);
            }
        }

        togglePostAttrs(post);

        if(profile.length == 0){
            $("html, body").animate({
                scrollTop: post.offset().top - 60
            }, 1000);
        } else {
            if(post.hasClass("ja-profile-post-max")){
                post.removeClass("ja-profile-post-max");

                profile.find(".ja-post").removeClass(hiddenProfileSelector);
            } else {
                post.addClass("ja-profile-post-max");

                profile.find(".ja-post:not(.ja-profile-post-max)").addClass(hiddenProfileSelector);
            }
        }
	}

	function togglePostAttrs(post){
        post.toggleClass("ja-post-max").toggleClass("ja-post-min");

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