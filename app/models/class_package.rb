class ClassPackage < ApplicationRecord
  include SaveName
  attr_accessor :current_user

  has_one_attached :class_member_photo
  has_many :date_class_availables, dependent: :destroy
  accepts_nested_attributes_for :date_class_available, allow_destroy: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at",
     "created_by",
     "id",
     "name",
     "description",
     "price",
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

  # Validasi

  validates :name, presence: { message: "Name class can't be blank" },
                   length: { minimum: 3, message: "Name class must be at least 3 characters" }

  validates :description, presence: { message: "Description class can't be blank" }

  validates :price, presence: { message: "Price class can't be blank " },
                    numericality: { only_integer: true }
end
