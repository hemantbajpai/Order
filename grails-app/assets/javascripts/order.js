/**
 * Created by HI7 on 4/30/2017.
 */
$(function(){
    $('.quantity').on('change', function () {

        var id = $(this).data('id');
        var qty = $(this)[0].value;
        var request = $.ajax({
            url: '/myorder/changeQuantity/?format=json',
            data:{id:id, qty:qty},
            method: 'POST'
        });
        request.done(function (data) {
            $('#label-' + data.object.id).text(data.object.currentPrice);
            $('#price').text(data.price)
            console.log("success")
        });
        request.fail(function (data) {
            console.log("failed")
        });
    });

    $('.size').on('change', function () {

        var id = $(this).data('id');
        var size = $(this)[0].value;
        var request = $.ajax({
            url: '/myorder/changeSize/?format=json',
            data:{id:id, size:size},
            method: 'POST'
        });
        request.done(function (data) {
            $('#label-' + data.object.id).text(data.object.currentPrice);
            $('#price').text(data.price)
            console.log("success")
        });
        request.fail(function (data) {
            console.log("failed")
        });
    });

    $('.delete').on('click', function () {

        var id = $(this).data('id');

        var request = $.ajax({
            url: '/myorder/deleteItem/?format=json',
            data:{id:id},
            method: 'POST'
        });
        request.done(function (data) {
            $('#' + data.object.id)[0].parentNode.removeChild($('#' + data.object.id)[0])
            $('#price').text(data.price)
            console.log("success")
        });
        request.fail(function (data) {
            console.log("failed")
        });
    });
})