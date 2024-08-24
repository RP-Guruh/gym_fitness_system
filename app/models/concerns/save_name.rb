module SaveName
  extend ActiveSupport::Concern

  # Include this module to automatically save the ID and name of the user who
  # created and last updated a record.
  #
  # This module uses the before_create and after_update callbacks to save the
  # user's data. The before_create callback is used to save the user's ID and
  # name when the record is created. The after_update callback is used to save
  # the user's ID and name when the record is updated.
  #
  # The methods used by this module are private, so they cannot be accessed
  # directly by the user of this module.
  included do
    before_create :save_creator_name
    before_update :updated_creator_name 
  end

  private
    # Saves the creator's name and ID when the object is created.
    # 
    # Sets the `created_by` attribute to the ID of the current user and the 
    # `created_by_name` attribute to the name of the current user if a current 
    # user exists.
    # 
    # Parameters: None
    # 
    # Returns: None
    def save_creator_name
        self.created_by = current_user.id if current_user
        self.created_by_name = current_user.email if current_user
    end

    # Updates the updated_by, updated_by_name, and updated_at attributes of the object.
    # 
    # Sets the `updated_by` attribute to the ID of the current user, the `updated_by_name` 
    # attribute to the name of the current user, and the `updated_at` attribute to the 
    # current time if a current user exists.
    # 
    # Parameters: None
    # 
    # Returns: None
    def updated_creator_name
      self.updated_by = current_user.id if current_user
      self.updated_by_name = current_user.email if current_user
      self.updated_at = DateTime.now
    end

 

end