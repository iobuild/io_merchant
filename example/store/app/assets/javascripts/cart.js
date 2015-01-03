$(document).ready(function() {

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

});
