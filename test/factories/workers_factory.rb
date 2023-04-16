# frozen_string_literal: true

FactoryBot.define do
  # Create a worker
  factory :worker do
    first_name { Faker::Worker.first_name }
    last_name { Faker::Worker.last_name }
    phone_number { Faker::Worker.phone_number }
    job { Faker::Worker.job }
  end
end
