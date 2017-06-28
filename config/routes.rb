Rails.application.routes.draw do



  get 'likes/like_itenary'

  get 'likes/unlike_itenary'

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :itenaries 
  resources :items do
    resources :sub_items
  end
  resources :users, only: [:show, :index, :update] do
    resources :profiles, only: [:show, :edit, :update]
    collection do
      patch 'first_time_update_password'
      get 'first_time_edit_password'
    end
  end
  # resources :follows,       only: [:create, :destroy]
  post ':user_id/follow_user', to: 'follows#follow_user', as: :follow_user
  post ':user_id/unfollow_user', to: 'follows#unfollow_user', as: :unfollow_user

  post ':id/like_itenary', to: 'likes#like_itenary', as: :like_itenary
  post ':id/unlike_itenary', to: 'likes#unlike_itenary', as: :unlike_itenary

  post ':id/bookmark_itenary', to: 'bookmarks#bookmark_itenary', as: :bookmark_itenary
  post ':id/unbookmark_itenary', to: 'bookmarks#unbookmark_itenary', as: :unbookmark_itenary

  


  # resources :users do
  #   member do
  #     get :following, :followers
  #   end
  # end
  
end
