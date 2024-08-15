class AddCreatedByToProductCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :product_categories, :created_by, :integer
  end
end
