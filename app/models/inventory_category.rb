class InventoryCategory < ApplicationRecord
  include SaveName
  attr_accessor :current_user

  validates :name, presence: { message: "Inventory category name can't be blank" },
                   length: { minimum: 3, message: "Inventory category name must be at least 3 characters" }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "created_by", "description", "id", "name", "updated_at", "created_by_name", "updated_by_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  ransacker :created_at do
    Arel.sql("date(created_at)")
  end
end
