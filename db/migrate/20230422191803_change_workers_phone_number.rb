# frozen_string_literal: true

class ChangeWorkersPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    remove_column :workers, :phone_number, :string
    add_column :workers, :phone_number, :bigint, null: false, default: 11_111_111_111
  end
end
