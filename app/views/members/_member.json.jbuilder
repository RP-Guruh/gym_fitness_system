json.extract! member, :id, :name, :users_id, :email, :handphone_number, :gender, :address, :province, :emergency_phone_name, :emergency_phone_number, :emergency_phone_status, :membership_start_date, :membership_end_date, :status, :membership_package_id, :created_at, :updated_at
json.url member_url(member, format: :json)
