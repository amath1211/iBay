json.extract! user, :id, :full_name, :username, :password_hash, :address, :created_at, :updated_at
json.url user_url(user, format: :json)
