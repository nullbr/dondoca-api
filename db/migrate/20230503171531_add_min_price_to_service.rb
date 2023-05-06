# frozen_string_literal: true

class AddMinPriceToService < ActiveRecord::Migration[7.0]
  def change
    add_column :services, :min_price, :boolean, null: false, default: false
  end
end
