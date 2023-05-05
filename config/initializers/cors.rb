# frozen_string_literal: true

origins_url = Rails.env.production? ? Rails.application.credentials[Rails.env.to_sym][:CORS_ORIGIN] : '*'

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins origins_url
    resource '/api/v1/*',
             headers: :any,
             methods: %i[get post patch put delete]
  end
end
