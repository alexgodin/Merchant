$(document).ready ->
  $(".addToCart").click (clickEvent) ->
    name = $(clickEvent.target.parentElement).children(".name").val()
    quantity = $(clickEvent.target.parentElement).children(".quantity").val()
    $.ajax
      type: "POST"
      url: "/orderlines/new"
      data: {quantity: quantity, name: name}
    $(clickEvent.target.parentElement).children(".quantity").val(1)

Pusher.log = (message) ->
  console.log(message)
pusher = new Pusher("db515d9b66048ec3c10a")
channel = pusher.subscribe("total")
channel.bind("updateTotal", (data) ->
  $(".total").text("$#{data}")
)
