Rails.application.routes.draw do

  root 'garages#index'
  resources :garages

end
