Rails.application.routes.draw do

  get 'pages/about'

  get 'pages/contact'

  root 'garages#index'
  resources :garages

end
