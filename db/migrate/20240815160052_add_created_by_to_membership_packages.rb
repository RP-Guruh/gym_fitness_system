class AddCreatedByToMembershipPackages < ActiveRecord::Migration[7.1]
  def change
    add_column :membership_packages, :created_by, :integer
  end
end
