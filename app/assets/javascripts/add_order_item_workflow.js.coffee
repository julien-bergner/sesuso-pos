# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

get_json: (order_id) ->
  $.getJSON "http://localhost:3000/frontend/order.json?order_id=1" + order_id, (data) ->
    get_json_callback(data)

get_json_callback: (data) ->
