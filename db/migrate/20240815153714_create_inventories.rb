class CreateInventories < ActiveRecord::Migration[7.1]
  def change
    create_table :inventories do |t|
      t.string :name
      t.text :description
      t.references :inventory_category, null: false, foreign_key: true
      t.integer :quantity
      t.string :product_image
      t.date :purchase_date

      t.timestamps
    end
  end
end
