Rails.application.routes.draw do
  namespace :admin do
    resources :blocks
    resources :cards
    resources :users
    resources :roles

    root to: "blocks#index"
  end

  filter :locale

  root 'main#index'

  scope module: 'home' do
    resources :user_sessions, only: [:new, :create]
    resources :users, only: [:new, :create]
    get 'login' => 'user_sessions#new', :as => :login

    post 'oauth/callback' => 'oauths#callback'
    get 'oauth/callback' => 'oauths#callback'
    get 'oauth/:provider' => 'oauths#oauth', as: :auth_at_provider
  end

  scope module: 'dashboard' do
    resources :user_sessions, only: :destroy
    resources :users, only: :destroy
    post 'logout' => 'user_sessions#destroy', :as => :logout

    resources :cards
    resources :words, only: [:index, :create]

    resources :blocks do
      member do
        put 'set_as_current'
        put 'reset_as_current'
      end
    end

    get 'flickr' => 'flickrs#index'

    put 'review_card' => 'trainer#review_card'
    get 'trainer' => 'trainer#index'

    get 'profile/:id/edit' => 'profile#edit', as: :edit_profile
    put 'profile/:id' => 'profile#update', as: :profile
    get 'status' => 'profile#status'
  end
end
