# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins Rails.application.credentials[Rails.env.to_sym][:CORS_ORIGIN]
    resource '/api/v1/*',
             headers: :any,
             methods: %i[get post patch put delete]
  end
end
