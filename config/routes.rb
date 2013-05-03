SesusoPos::Application.routes.draw do

  match "/startAddOrderItemWorkflow" => "add_order_item_workflow#start", :as => :startAddOrderItemWorkflow
  match "/selectCategory" => "add_order_item_workflow#selectCategory", :as => :selectCategory
  match "/receiveSelectedCategory" => "add_order_item_workflow#receiveSelectedCategory", :as => :receiveSelectedCategory
  match "/selectProduct" => "add_order_item_workflow#selectProduct", :as => :selectProduct

  match "/startAddOrderWorkflow" => "frontend#startAddOrderWorkflow", :as => :startAddOrderWorkflow
  match "/selectTable" => "frontend#selectTable", :as => :selectTable
  match "/receiveSelectedTable" => "frontend#receiveSelectedTable", :as => :receiveSelectedTable
  match "/createOrderIfNotExisting" => "frontend#createOrderIfNotExisting", :as => :createOrderIfNotExisting

  match "/showOrder" => "frontend#showOrder", :as => :showOrder
  match "/showAllOrders" => "frontend#showAllOrders", :as => :showAllOrders








  resources :order_items

  resources :products

  resources :categories

  resources :orders

  resources :restaurant_tables

  resources :restaurants

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

end