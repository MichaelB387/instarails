json.extract! profile, :id, :username_id, :username, :name, :bio, :created_at, :updated_at
json.url profile_url(profile, format: :json)
