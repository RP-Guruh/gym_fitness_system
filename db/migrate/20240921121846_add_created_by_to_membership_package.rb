class AddCreatedByToMembershipPackage < ActiveRecord::Migration[7.1]
  def change
    add_column :membership_packages, :created_by_name, :string
    add_column :membership_packages, :updated_by, :integer
    add_column :membership_packages, :updated_by_name, :string
  end
end
