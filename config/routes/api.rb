# frozen_string_literal: true

namespace :api do
  namespace :v1 do
    scope :users, module: :users do
      post '/', to: 'registrations#create', as: :user_registration
      patch '/', to: 'registrations#edit', as: :edit_user
    end
    resources :workers
    resources :clients
    resources :schedules
    resources :services
    resources :categories

    get '/users/me', to: 'users#me'
  end
end

scope :api do
  scope :v1 do
    # Swagger documentation
    scope :swagger do
      get '/', to: 'apidocs#index', as: :swagger_root
      get '/data', to: 'apidocs#data', as: :swagger_data
    end
    use_doorkeeper do
      skip_controllers :authorizations, :applications, :authorized_applications
    end
  end
end
