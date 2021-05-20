json.extract! user_public, :id, :created_at, :updated_at
json.url user_public_url(user_public, format: :json)
