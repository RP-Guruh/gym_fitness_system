class AddCreatedByToProductTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :product_transactions, :created_by, :integer
  end
end
