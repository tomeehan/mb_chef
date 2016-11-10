class AddEndingToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :ending, :boolean
  end
end
