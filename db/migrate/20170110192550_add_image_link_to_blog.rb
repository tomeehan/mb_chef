class AddImageLinkToBlog < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :image_link, :string
  end
end
