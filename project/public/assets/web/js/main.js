$(document).ready(function () {
    $('.btnUserLogout').on("click", function (e) {
        e.preventDefault();
        let url = $(this).attr("href");
        $.ajax({
            url: url,
            type: "POST",
            dataType: "JSON",
            headers: {'X-CSRF-TOKEN': $(this).prev('input[name="_token"]').val()},
        }).done(function (response) {
            if (response.hasOwnProperty('refreshPage') && response.refreshPage) {
                return window.location.reload(true);
            }
        });
    });
});
