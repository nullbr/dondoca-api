# frozen_string_literal: true

Rails.application.routes.draw do
  resources :clients
  resources :schedules
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  root 'pages#home'

  use_doorkeeper
  devise_for :users
  resources :workers

  draw :api
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
