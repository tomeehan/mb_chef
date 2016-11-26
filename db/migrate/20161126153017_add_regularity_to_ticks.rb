class AddRegularityToTicks < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :regularity_id, :integer
  end
end
