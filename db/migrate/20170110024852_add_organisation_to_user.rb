class AddOrganisationToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :organisation, :string
  end
end
