json.extract! hospital, :id, :slug, :name, :description, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
