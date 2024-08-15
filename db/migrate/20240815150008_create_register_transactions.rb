class CreateRegisterTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :register_transactions do |t|
      t.references :member, null: false, foreign_key: true
      t.references :membership_package, null: false, foreign_key: true
      t.string :transaction_type
      t.date :transaction_date
      t.string :transaction_file
      t.decimal :amount, precision: 10, scale: 2
      t.decimal :balance, precision: 10, scale: 2
      t.decimal :refund, precision: 10, scale: 2
      t.string :payment_method
      t.string :status, default: 'pending'

      t.timestamps
    end
  end
end
