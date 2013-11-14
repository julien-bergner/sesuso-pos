SesusoPos::Application.routes.draw do

  match "/addOrderItem" => "add_order_item_workflow#deliverMultiplePage", :as => :startAddOrderItemWorkflow
  match "/selectCategory" => "add_order_item_workflow#selectCategory", :as => :selectCategory
  match "/receiveSelectedCategory" => "add_order_item_workflow#receiveSelectedCategory", :as => :receiveSelectedCategory
  match "/selectProduct" => "add_order_item_workflow#selectProduct", :as => :selectProduct
  match "/receiveSelectedProduct" => "add_order_item_workflow#receiveSelectedProduct", :as => :receiveSelectedProduct
  match "/increaseOrderItemQuantity" => "frontend#increaseOrderItemQuantity", :as => :increaseOrderItemQuantity
  match "/decreaseOrderItemQuantity" => "frontend#decreaseOrderItemQuantity", :as => :decreaseOrderItemQuantity


  match "/startAddOrderWorkflow" => "frontend#startAddOrderWorkflow", :as => :startAddOrderWorkflow
  match "/selectTable" => "frontend#selectTable", :as => :selectTable
  match "/receiveSelectedTable" => "frontend#receiveSelectedTable", :as => :receiveSelectedTable
  match "/createOrderIfNotExisting" => "frontend#createOrderIfNotExisting", :as => :createOrderIfNotExisting

  match "/showOrder" => "frontend#showOrder", :as => :showOrder
  match "/showAllOrders" => "frontend#showAllOrders", :as => :showAllOrders
  match "/checkout" => "frontend#checkout", :as => :checkout








  resources :order_items

  resources :products

  resources :categories

  resources :orders

  resources :restaurant_tables

  resources :restaurants

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "frontend#showAllOrders"
  devise_for :users
  resources :users

end