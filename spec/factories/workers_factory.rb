# frozen_string_literal: true

FactoryBot.define do
  # Create a worker
  factory :worker do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    instagram { Faker::Name.first_name }
    image_url { 'https://example.url.com' }

    Faker::Config.locale = 'pt-BR'
    phone_number { Faker::PhoneNumber.phone_number }

    job { Faker::Job.title }
  end
end
