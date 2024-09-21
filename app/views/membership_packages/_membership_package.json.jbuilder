json.extract! membership_package, :id, :name, :description, :price, :duration, :status, :created_at, :updated_at
json.url membership_package_url(membership_package, format: :json)
