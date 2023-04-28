# frozen_string_literal: true

class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.bigint :phone_number
      t.string :job

      t.timestamps
    end
  end
end
