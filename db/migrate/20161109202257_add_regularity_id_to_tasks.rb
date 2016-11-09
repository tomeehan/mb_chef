class AddRegularityIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :regularity_id, :integer
  end
end
