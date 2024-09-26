class Permission < ApplicationRecord
  belongs_to :role
  validates :action, :resource, presence: true
  include SaveName
  attr_accessor :current_user

  RESOURCE_LIST = [
    "Employee",
    "Province",
    "Regency",
    "InventoryCategory",
    "ProductCategory",
    "User",
    "Permission",
    "MembershipPackage",
    "Member",
  ]

  ACTION_LIST = [
    "read",
    "create",
    "index",
    "edit",
    "destroy",
  ]

  validates :resource, inclusion: { in: RESOURCE_LIST }
  validates :action, inclusion: { in: ACTION_LIST }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "created_by", "action", "id", "resource", "updated_at", "created_by_name", "updated_by_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  ransacker :created_at do
    Arel.sql("date(created_at)")
  end
end
