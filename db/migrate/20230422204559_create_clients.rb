# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.bigint :phone_number, null: false, unique: true
      t.datetime :birthday

      t.timestamps
    end
  end
end
