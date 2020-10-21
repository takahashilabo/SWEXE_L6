Rails.application.routes.draw do
  get 'top/login_form'
  post 'top/login'
  get 'top/logout'
  resources :tweets
  resources :users
  root 'tweets#index'
  resources :likes
end
