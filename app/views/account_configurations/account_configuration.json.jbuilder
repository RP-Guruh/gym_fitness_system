json.extract! user, :id, :email, :encrypted_password, :created_at, :updated_at, :role_id
json.url user_url(user, format: :json)
