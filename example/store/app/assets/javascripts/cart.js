// $(document).ready(function() {
$(document).on('ready page:load', function () {

  $('.add-to-cart').click(function() {

    id = $(this).data('id')

    // alert(id);

    $.ajax({
      type: 'get',
      url: "/home/add_to_cart",
      data: {
        id: id
      },
      success: function(data) {
        $('#cart-number').html('(' + data + ')')
      },
      error: function(data) {
      }
    });

  });



  $('.remove-cart-item').click(function() {

    id = $(this).data('id')

    // alert(id);

    $.ajax({
      type: 'get',
      url: "/carts/remove_item",
      data: {
        id: id
      },
      success: function(data) {
        $('.ajax-file').html(data)
      },
      error: function(data) {
      }
    });

  });


});
