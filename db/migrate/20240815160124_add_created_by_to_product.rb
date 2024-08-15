class AddCreatedByToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :created_by, :integer
  end
end
