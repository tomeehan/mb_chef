class AddUserIdToStaff < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :user_id, :integer
  end
end
