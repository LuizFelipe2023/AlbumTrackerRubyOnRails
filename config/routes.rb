Rails.application.routes.draw do
  get "home/index"
  
  resource :sessions
  resources :passwords, param: :token
  resources :users

  resources :topics
  resources :posts do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :genres
  resources :bands
  resources :styles
  resources :reviews
  resources :albums do
    get 'reviews', to: 'reviews#album_reviews', as: :reviews
  end

  resources :favorites, only: [:index] do
    collection do
      post   'favorite_album'
      delete 'unfavorite_album'
      post   'favorite_band'
      delete 'unfavorite_band'
    end
  end

  root "root#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
