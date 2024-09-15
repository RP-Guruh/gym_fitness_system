class AddColumnToPermission < ActiveRecord::Migration[7.1]
  def change
    add_column :permissions, :created_by, :integer
    add_column :permissions, :created_by_name, :string
    add_column :permissions, :updated_by, :integer
    add_column :permissions, :updated_by_name, :string
  end
end
