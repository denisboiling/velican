//= require jquery
//= require jquery_ujs
//= require rails.validations

$(document).ready(function(){
   $('#main .popup a').click(function() {
                $('#order').show();
        });

        $('#order .order_cl button').click(function() {
                $('#order').hide();
        });

        $('#catalog_main .cart a').click(function() {
                $('#order').show();
        });

        $('#order .order_cl button').click(function() {
                $('#order').hide();
        });

        $('#catalog_main .item_container').click(function() {
                $('#popup_pr').show();
        });

        $('#popup_pr .cart a').click(function() {
                $('#order').show();
        });

        $('#popup_pr').click(function() {
                $('#popup_pr').hide();
        });
});
