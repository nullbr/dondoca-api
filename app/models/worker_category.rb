# frozen_string_literal: true

class WorkerCategory < ApplicationRecord
  belongs_to :worker
  belongs_to :category
end
