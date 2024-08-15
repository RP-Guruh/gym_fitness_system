class AddCreatedByToInventoryCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :inventory_categories, :created_by, :integer
  end
end
