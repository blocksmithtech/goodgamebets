require 'sidekiq/web'
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'visitors#index'
  devise_for :users
  resources :users

  resources :bets, only: [:create]

  # config/routes.rb
  authenticate :admin_user do
    mount Sidekiq::Web => '/sidekiq'
  end
end
