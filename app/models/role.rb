class Role < ApplicationRecord
  has_many :permissions
  has_many :users

  validates :key, presence: { message: "key cannot be blank" },
                  length: { minimum: 3, message: "minimal 3 character " },
                  :uniqueness => true

  validates :name, presence: { message: "name cannot be blank" },
                   length: { minimum: 3, message: "minimal 3 character " },
                   :uniqueness => true

  include SaveName
  attr_accessor :current_user

  def self.ransackable_attributes(auth_object = nil)
    ["created_at",
     "created_by",
     "id",
     "name",
     "key",
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
