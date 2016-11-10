class AddUserIdToTicks < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :user_id, :integer
  end
end
