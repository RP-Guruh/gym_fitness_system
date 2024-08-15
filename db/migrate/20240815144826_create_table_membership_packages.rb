class CreateTableMembershipPackages < ActiveRecord::Migration[7.1]
  def change
    create_table :membership_packages do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.integer :duration
      t.string :status, default: "Active"

      t.timestamps
    end
  end
end
