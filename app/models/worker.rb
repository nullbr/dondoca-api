# frozen_string_literal: true

class Worker < ApplicationRecord
  has_many :schedules, dependent: :destroy, inverse_of: :workers
end
