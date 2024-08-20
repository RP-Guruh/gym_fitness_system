class ProductCategory < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "created_by", "description", "id", "name", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
      []
  end

  ransacker :created_at do
    Arel.sql('date(created_at)')
  end
end
