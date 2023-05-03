# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.boolean :featured, null: false, default: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
