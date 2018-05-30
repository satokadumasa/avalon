json.extract! user_page, :id, :user_id, :page_id, :created_at, :updated_at
json.url user_page_url(user_page, format: :json)
