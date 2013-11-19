json.order do

  json.id @order.id
  json.caption @order.restaurant_table.caption

  json.categories @order_items_grouped_by_categories.keys do |category|

    json.id category.id
    json.caption category.caption

    json.order_items @order_items_grouped_by_categories.fetch(category) do |order_item|

      json.id order_item.id
      json.quantity order_item.quantity
      json.number order_item.product.number
      json.caption order_item.product.caption

    end

  end

end



