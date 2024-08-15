class CreateTableTrainers < ActiveRecord::Migration[7.1]
  def change
    create_table :trainers do |t|
      t.string :name
      t.references :users, foreign_key: true
      t.string :email, index: { unique: true }
      t.string :handphone_number
      t.string :gender
      t.text :address
      t.string :city
      t.string :province
      t.string :emergency_phone_name
      t.string :emergency_phone_number
      t.string :emergency_phone_status
      t.string :specialization
      t.date :join_date
      t.date :end_date
      t.string :status, default: 'Active'


      t.timestamps
    end
  end
end
