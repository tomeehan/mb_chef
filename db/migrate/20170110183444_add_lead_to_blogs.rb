class AddLeadToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :lead, :text
  end
end
