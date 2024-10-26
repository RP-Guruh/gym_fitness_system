class AddStatusAndAvailableDateToClassPackages < ActiveRecord::Migration[7.1]
  def change
    add_column :class_packages, :created_by_name, :string
    add_column :class_packages, :updated_by, :integer
    add_column :class_packages, :updated_by_name, :string
    add_column :class_packages, :status, :string, default: "available", null: false
    add_column :class_packages, :available_date, :json
  end
end
