class AddActiveToTicks < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :active, :boolean, :default => true
  end
end
