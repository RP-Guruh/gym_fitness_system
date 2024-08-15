class CreateTableMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :name
      t.references :users, foreign_key: true
      t.string :email, index: {unique: true}
      t.string :handphone_number
      t.string :gender
      t.text :address
      t.string :city
      t.string :province
      t.string :emergency_phone_name
      t.string :emergency_phone_number
      t.string :emergency_phone_status
      t.date :membership_start_date
      t.date :membership_end_date
      t.integer :created_by
      t.string :status, default: "Active"

      t.timestamps
    end
  end
end
