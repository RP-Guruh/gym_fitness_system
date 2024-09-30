class ProductCategory < ApplicationRecord
  after_validation :log_validation_errors, if: -> { errors.any? }
  include SaveName
  attr_accessor :current_user
  validates :description, presence: { message: "Product category description can't be blank" },
                          length: { minimum: 3, message: "Product category description must be at least 3 characters" }
  validates :name, presence: { message: "Product category name can't be blank" },
                   length: { minimum: 3, message: "Product category name must be at least 3 characters" }

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "created_by", "description", "id", "name", "updated_at", "created_by_name", "updated_by_name"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def log_validation_errors
    Rails.logger.error "Validation failed for #{self.class.name} with ID #{self.id}: #{errors.full_messages.join(", ")}"
  end

  ransacker :created_at do
    Arel.sql("date(created_at)")
  end
end
