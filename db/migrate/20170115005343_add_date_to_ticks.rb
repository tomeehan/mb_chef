class AddDateToTicks < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :date, :datetime
  end
end
