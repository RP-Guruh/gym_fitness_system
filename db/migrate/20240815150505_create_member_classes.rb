class CreateMemberClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :member_classes do |t|
      t.references :member, null: false, foreign_key: true
      t.references :class_package, null: false, foreign_key: true
      t.date :enrollment_date
      t.string :status

      t.timestamps
    end
  end
end
