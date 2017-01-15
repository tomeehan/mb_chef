class AddFormerAndFormerDateToStaff < ActiveRecord::Migration[5.0]
  def change
    add_column :staffs, :former, :boolean, default: false
    add_column :staffs, :former_date, :date
  end
end
