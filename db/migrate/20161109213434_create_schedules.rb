class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.boolean :open
      t.boolean :mid
      t.boolean :close

      t.timestamps
    end
  end
end
