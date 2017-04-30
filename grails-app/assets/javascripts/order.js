/**
 * Created by HI7 on 4/30/2017.
 */
$(function(){
    $('#quantity').on('change', function () {

        var id = $(this).data('id');
        var qty = $(this)[0].value;
        var request = $.ajax({
            url: '/myorder/changeQuantity/?format=json',
            data:{id:id, qty:qty},
            method: 'POST'
        });
        request.done(function (data) {
            console.log("success")
        });
        request.fail(function (data) {
            console.log("failed")
        });
    });
})