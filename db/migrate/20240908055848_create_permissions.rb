class CreatePermissions < ActiveRecord::Migration[7.1]
  def change
    create_table :permissions do |t|
      t.string :action
      t.string :resource
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
