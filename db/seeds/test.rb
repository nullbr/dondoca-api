# frozen_string_literal: true

Doorkeeper::Application.create!(name: 'Dondoca Web', redirect_uri: '', scopes: '') if Doorkeeper::Application.count.zero?
