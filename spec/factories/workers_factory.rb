# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  # Create a worker
  factory :worker do
    Faker::Config.locale = 'pt-BR'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    instagram { Faker::Name.first_name }
    image_url { 'https://example.url.com' }
    phone_number { Faker::PhoneNumber.phone_number }

    job { Faker::Job.title }
  end
end
