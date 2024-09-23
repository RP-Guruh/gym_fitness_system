class AddCreatedByNameToMember < ActiveRecord::Migration[7.1]
  def change
    add_column :members, :created_by_name, :string
    add_column :members, :updated_by, :integer
    add_column :members, :updated_by_name, :string
  end
end
