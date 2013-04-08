SesusoPos::Application.routes.draw do
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