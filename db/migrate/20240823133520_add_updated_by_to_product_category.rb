class AddUpdatedByToProductCategory < ActiveRecord::Migration[7.1]
  def change
    add_column :product_categories, :updated_by, :integer
    add_column :product_categories, :created_by_name, :string
    add_column :product_categories, :updated_by_name, :string
  end
end
