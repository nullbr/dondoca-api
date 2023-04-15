class AddJobToWorker < ActiveRecord::Migration[7.0]
  def change
    add_column :workers, :job, :string
  end
end
