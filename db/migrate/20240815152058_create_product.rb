class CreateProduct < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :product_category, null: false, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.integer :quantity
      t.string :product_image
      t.date :expire_date

      t.timestamps
    end
  end
end
