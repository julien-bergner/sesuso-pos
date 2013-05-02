SesusoPos::Application.routes.draw do

  match "/startAddOrderItemWorkflow" => "add_order_item_workflow#start", :as => :startAddOrderItemWorkflow
  match "/selectTable" => "add_order_item_workflow#selectTable", :as => :selectTable
  match "/receiveSelectedTable" => "add_order_item_workflow#receiveSelectedTable", :as => :receiveSelectedTable
  match "/selectOrderItem" => "add_order_item_workflow#selectOrderItem", :as => :selectOrderItem
  match "/selectCategory" => "add_order_item_workflow#selectCategory", :as => :selectCategory
  match "/receiveSelectedCategory" => "add_order_item_workflow#receiveSelectedCategory", :as => :receiveSelectedCategory
  match "/selectProduct" => "add_order_item_workflow#selectProduct", :as => :selectProduct




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