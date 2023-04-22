# frozen_string_literal: true

class AddUniqueConstraintToWorkersPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    add_index :workers, :phone_number, unique: true
  end
end
