# frozen_string_literal: true

class AddDurationToService < ActiveRecord::Migration[7.0]
  def change
    change_table :workers, bulk: true do |t|
      t.integer :duration
      t.text :description
    end
  end
end
