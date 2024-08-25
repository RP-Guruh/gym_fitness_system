class AddCreatedByToInventoryCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :inventory_categories, :created_by_name, :string 
    add_column :inventory_categories, :updated_by, :integer
    add_column :inventory_categories, :updated_by_name, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
