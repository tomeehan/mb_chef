class AddStageToTicks < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :stage, :string
  end
end
