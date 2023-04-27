# frozen_string_literal: true

class ChangePhoneNumberColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :workers, :phone_number
    add_column :workers, :phone_number, :bigint
  end
end
