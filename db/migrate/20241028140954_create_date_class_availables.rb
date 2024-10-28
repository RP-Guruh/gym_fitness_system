class CreateDateClassAvailables < ActiveRecord::Migration[7.1]
  def change
    create_table :date_class_availables do |t|
      t.date :available_date
      t.string :note
      t.belongs_to :class_packages, null: false, foreign_key: true

      t.timestamps
    end
  end
end
