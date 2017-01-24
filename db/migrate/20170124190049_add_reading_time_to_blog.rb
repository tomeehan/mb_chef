class AddReadingTimeToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :reading_time, :integer
  end
end
