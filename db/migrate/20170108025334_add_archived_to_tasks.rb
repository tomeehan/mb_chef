class AddArchivedToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :archived, :boolean, :default => false
  end
end
