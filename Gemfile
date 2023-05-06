# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem 'sprockets-rails'

# Use pg as the database for Active Record
gem 'pg', '~> 1.1'

# Use the Puma web server [https://github.com/puma/puma]
gem 'puma', '~> 5.0'

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem 'importmap-rails'

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem 'turbo-rails'

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem 'stimulus-rails'

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem 'jbuilder'

# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Extand doorkeeper i18n
gem 'doorkeeper-i18n'

# Environment Variables
gem 'dotenv-rails', '~> 2.7.6'

# Adding serializers
gem 'active_model_serializers'

gem 'devise', '~> 4.8'

gem 'doorkeeper', '~> 5.5'

gem 'rack-cors', '~> 1.1'

gem 'rswag', '~> 2.5'

gem 'swagger-blocks', '~> 3.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  # A library for generating fake data such as names, addresses, and phone numbers [https://github.com/faker-ruby/faker]
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'main'
  # Required for RSpec specs
  gem 'rspec-rails'
  # Security tools
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'ruby_audit'
  # Linting
  gem 'rubocop'
  gem 'rubocop-minitest'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  # production deployment with capistrano
  gem 'bcrypt_pbkdf', '1.1.0'
  gem 'capistrano', '3.17.2'
  gem 'capistrano-passenger', '0.2.1'
  gem 'capistrano-rails', '1.6.2'
  gem 'capistrano-rbenv', '2.2.0'
  gem 'ed25519', '1.3.0'
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  # A library for setting up Ruby objects as test data [https://github.com/thoughtbot/factory_bot_rails]
  gem 'factory_bot_rails'
end

group :assets do
  gem 'uglifier', '~> 4.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
