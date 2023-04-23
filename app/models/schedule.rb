# frozen_string_literal: true

class Schedule < ApplicationRecord
  belongs_to :client
  belongs_to :worker

  scope :by_worker, ->(worker_id) { where(worker_id:) }
  scope :by_date, ->(date) { where(start_at: date.beginning_of_day..date.end_of_day) }
  # Ex:- scope :active, -> {where(:active => true)}
end
