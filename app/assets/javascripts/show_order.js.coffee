get_order_as_json_callback = (data) ->

  # Create objects from json
  order = new Order(data.order)

  # Add <li>'s for category dividers
  for category in data.order.categories
    $('#show-order-listview').
      append($('<li>').
        attr('data-role', 'list-divider').
        attr('role', 'heading').
        attr('class', 'ui-li ui-li-divider ui-bar-b').
          append(category.caption))

    # Add <li>'s for order item
    for order_item in category.order_items
      $('#show-order-listview').
        append($('<li>').
          attr('data-role', 'list-divider').
          attr('class', 'ui-li ui-li-static ui-btn-up-c').
            append($('<span>').

              append($('<a>').
                attr('href', '#').
                    attr('class', 'ui-btn ui-btn-up-c ui-shadow ui-btn-corner-all ui-btn-inline ui-btn-icon-notext').
                  append($('<span>').
                    attr('class', 'ui-btn-inner').
                      append($('<span>').
                        attr('class', 'ui-btn-text')).
                      append($('<span>').
                      attr('class', 'ui-icon ui-icon-minus ui-icon-shadow')))).

                append($('<span>').
                  attr('data-inline', 'true').
                  append("1x"))).

                  append($('<a>').
                  attr('href', '#').
                   attr('class', 'ui-btn ui-btn-up-c ui-shadow ui-btn-corner-all ui-btn-inline ui-btn-icon-notext').
                  append($('<span>').
                  attr('class', 'ui-btn-inner').
                  append($('<span>').
                  attr('class', 'ui-btn-text')).
                  append($('<span>').
                  attr('class', 'ui-icon ui-icon-plus ui-icon-shadow')))).

              append("Nr. #{order_item.number} - #{order_item.caption}")



      )

add_minus_button = () ->


get_order_as_json = (order_id) ->
  $.getJSON "http://carat.sesuso.de/frontend/order.json?order_id=" + order_id, (data) ->
    get_order_as_json_callback (data)


load_order_data = () ->
  get_order_as_json(1)

$("#show-order").on "pageshow", load_order_data()



#$('#content ul').append(
#  $('<li>').append(
#    $('<a>').attr('href','/user/messages').append(
#      $('<span>').attr('class', 'tab').append("Message center")
#    )));




#<a href="/decreaseOrderItemQuantity?order_item_id=18" data-icon="minus" data-iconpos="notext" data-inline="true" data-role="button">Neu</a>
#<span data-inline="true">1x</span>
#<a href="/increaseOrderItemQuantity?order_item_id=18" data-icon="plus" data-iconpos="notext" data-inline="true" data-role="button">Neu</a>

#Nr. 4 - Honigmelone
#</div>