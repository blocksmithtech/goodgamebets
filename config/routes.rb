require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'visitors#index'
  devise_for :users

  get 'dashboard' => 'users#index'

  resources :bets, only: [:create]
  resources :games, only: [:index, :show]

  # config/routes.rb
  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
