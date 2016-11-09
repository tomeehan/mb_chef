class AddScheduleIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :schedule_id, :integer
  end
end
