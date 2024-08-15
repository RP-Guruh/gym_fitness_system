class CreateInventoryConditions < ActiveRecord::Migration[7.1]
  def change
    create_table :inventory_conditions do |t|
      t.references :inventory, null: false, foreign_key: true
      t.string :condition
      t.integer :quantity

      t.timestamps
    end
  end
end
