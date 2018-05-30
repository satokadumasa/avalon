json.extract! note, :id, :title, :overview, :detail, :created_at, :updated_at
json.url note_url(note, format: :json)
