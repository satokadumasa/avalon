json.extract! user_pagecomment, :id, :user_id, :pagecomment_id, :created_at, :updated_at
json.url user_pagecomment_url(user_pagecomment, format: :json)
