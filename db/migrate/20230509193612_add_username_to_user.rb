# frozen_string_literal: true

class AddUsernameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string, unique: true
  end
end
