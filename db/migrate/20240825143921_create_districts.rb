class CreateDistricts < ActiveRecord::Migration[7.1]
  def change
    create_table :districts do |t|
      t.references :regency, null: false, foreign_key: true
      t.string :name
      t.integer :created_by
      t.string :created_by_name
      t.integer :updated_by
      t.string :updated_by_name

      t.timestamps
    end
  end
end
