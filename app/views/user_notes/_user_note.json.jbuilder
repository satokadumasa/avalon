json.extract! user_note, :id, :user_id, :note_id, :created_at, :updated_at
json.url user_note_url(user_note, format: :json)
