json.extract! image_file, :id, :user_id, :file_name, :comment, :created_at, :updated_at
json.url image_file_url(image_file, format: :json)
