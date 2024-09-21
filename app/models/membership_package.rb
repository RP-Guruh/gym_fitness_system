class MembershipPackage < ApplicationRecord
  include SaveName
  attr_accessor :current_user

  validates :name, presence: { message: "Name package can't be blank" },
                   length: { minimum: 3, message: "Name package must be at least 3 characters" }

  validates :description, presence: { message: "Description package can't be blank" },
                          length: { minimum: 5, message: "Description package must be at least 3 characters" }

  validates :price, :duration, presence: { message: "Price package can't be blank" }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at",
     "created_by",
     "id",
     "name",
     "price",
     "duration",
     "updated_at",
     "created_by_name",
     "updated_by_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  ransacker :created_at do
    Arel.sql("date(created_at)")
  end
end
