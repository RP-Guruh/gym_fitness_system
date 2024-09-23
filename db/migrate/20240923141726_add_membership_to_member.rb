class AddMembershipToMember < ActiveRecord::Migration[7.1]
  def change
    add_reference :members, :membership_package, null: false, foreign_key: true
  end
end
