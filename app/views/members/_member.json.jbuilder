json.extract! member, :id, :name, :user_id, :email, :handphone_number, :gender, :address, :province, :membership_start_date, :membership_end_date, :status, :membership_package_id, :created_at, :updated_at
json.url member_url(member, format: :json)
