json.extract! employee, :id, :user_id, :employee_id, :first_name, :last_name, :date_of_birth, :gender, :employee_photo, :address, :email, :hire_date, :job_title, :created_by, :created_by_name, :updated_by, :updated_by_name, :created_at, :updated_at
json.url employee_url(employee, format: :json)
