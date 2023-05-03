# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :services, dependent: :destroy
end
