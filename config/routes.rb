Rails.application.routes.draw do

  devise_for :users
  get 'pages/about'

  get 'pages/contact'

  root 'garages#index'
  resources :garages do
    collection do
      get 'search'
    end
    resources :reviews, except: [:index, :show]
  end

end
