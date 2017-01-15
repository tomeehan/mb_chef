class AddEditedToTicks < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :edited, :integer
  end
end
