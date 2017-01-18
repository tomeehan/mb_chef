class AddNoteToTick < ActiveRecord::Migration[5.0]
  def change
    add_column :ticks, :note, :text
  end
end
