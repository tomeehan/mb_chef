class AddStaffIdToTicks < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :staff_id, :integer
  end
end
