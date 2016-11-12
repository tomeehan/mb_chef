class CreateStaffs < ActiveRecord::Migration[5.0]
  def change
    create_table :staffs do |t|
      t.string :first_name
      t.string :surname
      t.string :email
      t.string :job_title
      t.boolean :manager
      t.integer :pin

      t.timestamps
    end
  end
end
