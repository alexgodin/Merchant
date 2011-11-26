/* DO NOT MODIFY. This file was compiled Sat, 26 Nov 2011 07:34:49 GMT from
 * /Users/alex/merchant/public/coffeescripts/product_index.coffee
 */

(function() {
  var channel, pusher;

  $(document).ready(function() {
    return $(".addToCart").click(function(clickEvent) {
      var name, quantity;
      name = $(clickEvent.target.parentElement).children(".name").val();
      quantity = $(clickEvent.target.parentElement).children(".quantity").val();
      $.ajax({
        type: "POST",
        url: "/orderlines/new",
        data: {
          quantity: quantity,
          name: name
        }
      });
      return $(clickEvent.target.parentElement).children(".quantity").val(1);
    });
  });

  Pusher.log = function(message) {
    return console.log(message);
  };

  pusher = new Pusher("db515d9b66048ec3c10a");

  channel = pusher.subscribe("total");

  channel.bind("updateTotal", function(data) {
    return $(".total").text("$" + data);
  });

}).call(this);
