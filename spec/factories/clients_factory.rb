# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  # Create a client
  factory :client do
    Faker::Config.locale = 'pt-BR'
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
