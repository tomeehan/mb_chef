class AddMiddayToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :midday, :boolean
  end
end
