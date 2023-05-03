# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :services, dependent: :destroy
  has_many :worker_categories, dependent: :destroy
  has_many :workers, through: :worker_categories
end
