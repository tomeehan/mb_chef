class CreateTicks < ActiveRecord::Migration[5.0]
  def change
    create_table :ticks do |t|
      t.boolean :complete
      t.float :temperature

      t.timestamps
    end
  end
end
