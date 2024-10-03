class CreateInstructures < ActiveRecord::Migration[7.1]
  def change
    create_table :instructures do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :email
      t.string :handphone_number
      t.string :gender
      t.text :address
      t.integer :city
      t.integer :province
      t.date :join_date
      t.string :status
      t.integer :created_by
      t.string :created_by_name
      t.integer :updated_by
      t.string :updated_by_name

      t.timestamps
    end
  end
end
