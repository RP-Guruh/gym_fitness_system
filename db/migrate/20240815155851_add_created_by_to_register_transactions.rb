class AddCreatedByToRegisterTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :register_transactions, :created_by, :integer
  end
end
