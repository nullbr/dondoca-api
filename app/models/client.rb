# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :schedules, dependent: :destroy, inverse_of: :clients
end
