Rails.application.routes.draw do



  get 'likes/like_itenary'

  get 'likes/unlike_itenary'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :itenaries 
  resources :items
  resources :users, only: [:show, :index]
  # resources :follows,       only: [:create, :destroy]
  post ':id/follow_user', to: 'follows#follow_user', as: :follow_user
  post ':id/unfollow_user', to: 'follows#unfollow_user', as: :unfollow_user

  post ':id/like_itenary', to: 'likes#like_itenary', as: :like_itenary
  post ':id/unlike_itenary', to: 'likes#unlike_itenary', as: :unlike_itenary

  # resources :users do
  #   member do
  #     get :following, :followers
  #   end
  # end
  
end
