json.extract! instructure, :id, :name, :user_id, :email, :handphone_number, :gender, :address, :city, :province, :join_date, :status, :created_by, :created_by_name, :updated_by, :updated_by_name, :created_at, :updated_at
json.url instructure_url(instructure, format: :json)
