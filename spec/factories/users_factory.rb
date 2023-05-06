# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'pt-BR'
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: Devise.password_length.first) }
  end
end
