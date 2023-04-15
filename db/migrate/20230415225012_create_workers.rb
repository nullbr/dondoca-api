class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers, id: :uuid do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number

      t.timestamps
    end
  end
end
