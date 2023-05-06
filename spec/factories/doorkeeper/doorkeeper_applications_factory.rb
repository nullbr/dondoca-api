# frozen_string_literal: true

FactoryBot.define do
  Faker::Config.locale = 'pt-BR'
  factory :doorkeeper_application, class: 'Doorkeeper::Application' do
    name { 'Example Client' }
    redirect_uri { '' }
    scopes { '' }
  end
end
