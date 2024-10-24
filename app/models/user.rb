class User < ApplicationRecord
  belongs_to :role
  has_one :employee
  has_one :member
  has_one :instructure

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.ransackable_attributes(auth_object = nil)
    ["created_at",
     "updated_at",
     "id",
     "email",
     "role_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  ransacker :created_at do
    Arel.sql("date(created_at)")
  end

  def employee
    Employee.find_by(user_id: self.id)
  end
end
