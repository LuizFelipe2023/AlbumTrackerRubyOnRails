Rails.application.routes.draw do
  get "home/index"
  resource :sessions
  resources :passwords, param: :token
  resources :genres
  resources :bands
  resources :styles
  resources :users 
  resources :reviews
  root "root#index"  

  get "up" => "rails/health#show", as: :rails_health_check
  
  resources :favorites, only: [:index] do
    collection do
      post   'favorite_album'
      delete 'unfavorite_album'
      post   'favorite_band'
      delete 'unfavorite_band'
    end
  end

  resources :albums do
    get 'reviews', to: 'reviews#album_reviews', as: :reviews
  end
  
end
