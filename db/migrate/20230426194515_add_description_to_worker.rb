# frozen_string_literal: true

class AddDescriptionToWorker < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :description, :text, nil: false, default: 'Dondoca'
  end
end
