Rails.application.routes.draw do



  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :itenaries 
  resources :items
  resources :users, only: [:show, :index]
  # resources :follows,       only: [:create, :destroy]
  post ':id/follow_user', to: 'follows#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'follows#unfollow_user', as: :unfollow_user

  resources :users do
    member do
      get :following, :followers
    end
  end
  
end
