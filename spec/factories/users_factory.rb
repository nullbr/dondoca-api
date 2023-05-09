# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'pt-BR'
    email { Faker::Internet.email }
    username { Faker::Internet.username }
    password { Faker::Internet.password(min_length: Devise.password_length.first) }
  end
end
