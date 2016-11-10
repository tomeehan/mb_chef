class AddTaskIdToTicks < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :task_id, :integer
  end
end
