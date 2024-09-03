class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.references :user, null: false, foreign_key: true
      t.string :employee_id
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.text :address
      t.string :email
      t.date :hire_date
      t.string :job_title
      t.integer :created_by
      t.string :created_by_name
      t.integer :updated_by
      t.string :updated_by_name

      t.timestamps
    end
  end
end
