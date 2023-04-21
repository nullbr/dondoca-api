# frozen_string_literal: true

Doorkeeper::Application.create!(name: 'Dondoca Web', redirect_uri: '', scopes: '') if Doorkeeper::Application.count.zero?

User.first_or_create(email: 'example@email.com',
                     password: 'password',
                     password_confirmation: 'password',
                     role: User.roles[:admin])
