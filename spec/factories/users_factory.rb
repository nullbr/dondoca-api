# frozen_string_literal: true

FactoryBot.define do
  Faker::Config.locale = 'pt-BR'
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: Devise.password_length.first) }
  end
end
