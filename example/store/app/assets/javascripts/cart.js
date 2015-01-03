// $(document).ready(function() {
$(document).on('ready page:load', function () {

  $('.add-to-cart').click(function() {

    var cart = $('.shopping-cart');
    var imgtodrag = $(this).parent('p').parent('td').parent('tr').find("img").eq(0);
    if (imgtodrag) {
      var imgclone = imgtodrag.clone()
          .offset({
          top: imgtodrag.offset().top,
          left: imgtodrag.offset().left
      })
          .css({
          'opacity': '0.5',
              'position': 'absolute',
              'height': '150px',
              'width': '150px',
              'z-index': '100'
      })
          .appendTo($('body'))
          .animate({
          'top': cart.offset().top + 10,
              'left': cart.offset().left + 10,
              'width': 75,
              'height': 75
      }, 1000, 'easeInOutExpo');
      
      setTimeout(function () {
          cart.effect("shake", {
              times: 2
          }, 200);
      }, 1500);

      imgclone.animate({
          'width': 0,
              'height': 0
      }, function () {
          $(this).detach()
      });
    }




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
        // $('.ajax-file').html(data)
        location.reload();
      },
      error: function(data) {
      }
    });

  });


});

