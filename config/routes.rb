Rails.application.routes.draw do

  resources :reviews
  devise_for :users
  get 'pages/about'

  get 'pages/contact'

  root 'garages#index'
  resources :garages

end
