// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require tether
//= require bootstrap-sprockets
//= require_tree .

$(function(){
    var keywordSearch = $("input.form-control.input-sm");
    var searchDiv = $("#mainNavCollapse .input-group");
    var searchResults = $("#keyword-search-results");

    var searchResultHighlightedSelector = "keyword-search-result-highlighted";
    var searchResultSelector = "keyword-search-result";
    var selectedKeywordSelector = ".selected-keyword";
    var removeSelectedKeywordSelector = selectedKeywordSelector + " .fa.fa-times";

    var timeoutId = null;

    keywordSearch.focus();

    $("body").on("click", function(){
        searchResults.empty().hide();
    })
    .on("click", removeSelectedKeywordSelector, function(){
        $(this).parent().remove();

        keywordSearch.closest("form").submit();
    })
    ;

    keywordSearch.on("keyup", function(e){
        var highlighted = searchResults.find("." + searchResultHighlightedSelector);
        var resultTop;

        if(e.which == 40){ // down
            if(highlighted.length == 0){
                searchResults.find("." + searchResultSelector + ":first").addClass(searchResultHighlightedSelector);
            } else if(highlighted.next().length != 0) {
                highlighted.removeClass(searchResultHighlightedSelector);

                highlighted.next().addClass(searchResultHighlightedSelector);

                resultTop = highlighted.next().position().top;
            }
        } else if(e.which == 38) { // up
            if(highlighted.prev().length != 0) {
                highlighted.removeClass(searchResultHighlightedSelector);

                highlighted.prev().addClass(searchResultHighlightedSelector);

                resultTop = highlighted.prev().position().top;
            }
        } else if(e.which != 13) {
            queueSearch();
        }

        if(resultTop > searchResults.height() || resultTop < searchResults.scrollTop()) {
            searchResults.scrollTop(resultTop + searchResults.scrollTop());
        }
    })
    .on("keydown", function(e){
        if(e.which == 13) {
            e.preventDefault();
        }
    })
    ;

    searchResults.on("click", "." + searchResultSelector, function(e){
        var selected = $(this);
        var keywordId = selected.attr("keywordId");
        var selectedKeyword = $(selectedKeywordSelector + ".template").clone();

        selectedKeyword.removeClass("template");
        selectedKeyword.css("display", "table-cell");
        selectedKeyword.attr("keywordId", keywordId);
        selectedKeyword.prepend(selected.text());

        selectedKeyword.append($("<input type='hidden' name='keyword_ids[]' value='" + keywordId + "'>"));

        keywordSearch.before(selectedKeyword);

        keywordSearch.closest("form").submit();
    })
    .on("mouseover", "." + searchResultSelector,function(e){
        searchResults.find("." + searchResultHighlightedSelector).removeClass(searchResultHighlightedSelector);

        $(this).addClass(searchResultHighlightedSelector);
    })
    ;

    function queueSearch(){
        if(timeoutId) {
            clearTimeout(timeoutId);
        }

        timeoutId = setTimeout(search, 1000);
    }

    function search(){
        var text = keywordSearch.val();
        var url = "/keywords.json?label=" + text;

        if(text.trim().length == 0){
            return;
        }

        searchResults.empty();

        $.getJSON(url, function(data){
            for(var i = 0;i < data.length; i++){
                var id = data[i].id;
                var label = data[i].label;

                label = label.replace(new RegExp(text, "ig"), function($1){
                    return "<b>" + $1 + "</b>"
                });

                var result = $("<div keywordId='" + id + "' class='" + searchResultSelector + "'>" + label + "</i></div>");

                searchResults.append(result);
            }

            searchResults.show();
        });
    }
})