# frozen_string_literal: true

class AddDurationToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :duration, :integer
    add_column :services, :description, :text
  end
end
