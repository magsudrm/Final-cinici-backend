$(document).ready(function () {

    $(document).on("click", ".remove-img-box", function (e) {
        console.log("Element clicked!");
        $(this).parent().remove();
    });

});
