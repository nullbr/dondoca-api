# frozen_string_literal: true

class AddPriceToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :price, :float, null: false, default: 0
  end
end
