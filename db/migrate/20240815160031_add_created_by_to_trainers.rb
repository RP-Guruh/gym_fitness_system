class AddCreatedByToTrainers < ActiveRecord::Migration[7.1]
  def change
    add_column :trainers, :created_by, :integer
  end
end
