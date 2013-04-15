r = Restaurant.create!(:caption => "Carat")
t = RestaurantTable.create!(:number => 1, :caption => "Tisch 1", :restaurant_id => r.id)

c = Category.create!(:caption => "Shisha")
p = Product.create!(:number => 1, :caption => "Apfel-Shisha", :price => 5.0, :category_id => c.id)

o = Order.create!(:restaurant_table_id => t.id)
oi = OrderItem.create!(:order_id => o.id, :product_id => p.id, :quantity => 1)
