class RemoveNoteFromTicks < ActiveRecord::Migration[5.0]
  def change
    remove_column :ticks, :note, :text
  end
end
