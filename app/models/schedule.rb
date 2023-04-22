# frozen_string_literal: true

class Schedule < ApplicationRecord
  belongs_to :client
  belongs_to :worker
end
