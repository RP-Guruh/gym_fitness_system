class AddCreatedByToClassPackages < ActiveRecord::Migration[7.1]
  def change
    add_column :class_packages, :created_by, :integer
  end
end
