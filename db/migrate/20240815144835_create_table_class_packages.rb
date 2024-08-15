class CreateTableClassPackages < ActiveRecord::Migration[7.1]
  def change
    create_table :class_packages do |t|
      t.string :name
      t.text :description
      t.references :trainers, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.integer :duration
      t.string :status, default: "Active"

      t.timestamps
    end
  end
end
