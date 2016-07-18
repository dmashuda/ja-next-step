$(function(){
    $(".field input[type='checkbox']").on("change", function(){
        var chkbx = $(this);
        var selects = chkbx.closest(".field").find("select");
        var chkd = chkbx.is(":checked");

        if(chkd){
            selects.prop("disabled", false);
        } else {
            selects.prop("disabled", true);
        }
    })

    $(".field input[type='checkbox']").change();
});
