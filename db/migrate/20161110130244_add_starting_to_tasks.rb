class AddStartingToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :starting, :boolean
  end
end
