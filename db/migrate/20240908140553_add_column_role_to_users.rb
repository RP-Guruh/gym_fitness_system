class AddColumnRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :role, null: false, foreign_key: true, default: Role.first.id
  end
end
