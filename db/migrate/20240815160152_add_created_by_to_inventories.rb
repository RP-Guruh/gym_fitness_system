class AddCreatedByToInventories < ActiveRecord::Migration[7.1]
  def change
    add_column :inventories, :created_by, :integer
  end
end
