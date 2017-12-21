Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root "static_pages#home", page: "home"
  get "/static_pages/:page", to: "static_pages#show"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "categories/shirt"
  get "categories/pant"
  get "categories/dress"
  get "categories/vest"
  get  "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :products
  resources :users
  resources :comments, only: [:create, :destroy]
  resources :categories, only: [:index, :show]
  resources :order_lines
  resource :cart, only: [:show]
  resources :orders
  # namespace :admin do
  #   resources :products
  #   resources :categories, except: [:edit, :update, :destroy]
  #   resources :orders
  # end
  namespace :shipper do
    resources :orders
  end

end
