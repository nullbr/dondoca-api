# frozen_string_literal: true

class CreateWorkerCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_categories do |t|
      t.references :worker, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
