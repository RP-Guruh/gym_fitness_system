class AddRoleToTableName < ActiveRecord::Migration[7.1]
  def change
    add_column :roles, :created_by, :integer
    add_column :roles, :created_by_name, :string
    add_column :roles, :updated_by, :integer
    add_column :roles, :updated_by_name, :string
  end
end
