# frozen_string_literal: true

class Worker < ApplicationRecord
  has_many :schedules, dependent: :destroy, inverse_of: :worker

  validates :first_name, :job, :description, presence: true
  validates :first_name, :last_name, :job, length: { maximum: 100 }
  # validates :phone_number, format: { with: /\A\d{11}\z/, message: 'precisa conter 11 dígitos' }
end
