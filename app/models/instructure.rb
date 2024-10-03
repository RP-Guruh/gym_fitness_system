class Instructure < ApplicationRecord
  include SaveName
  attr_accessor :current_user

  belongs_to :user
  validates_associated :user

  has_one_attached :instructure_photo

  def self.ransackable_attributes(auth_object = nil)
    ["created_at",
     "created_by",
     "id",
     "name",
     "email",
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
  validates :name, length: { minimum: 3, message: "Name must have at least 3 characters" }

  validates :email, uniqueness: { message: "Email must be unique" },
                    format: { with: URI::MailTo::EMAIL_REGEXP, message: "Email format is invalid" }

  validate :date_cannot_be_in_the_future

  with_options presence: { message: "This field cannot be blank" } do
    validates :name
    validates :handphone_number
    validates :gender
    validates :address
    validates :city
    validates :province
    validates :email
    validates :join_date
  end

  with_options numericality: { message: "This field must be number" } do
    validates :handphone_number
  end

  private

  def date_cannot_be_in_the_future
    if join_date.present? && join_date > Date.today
      errors.add(:join_date, "can't be in the future")
    end
  end
end
