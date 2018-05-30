json.extract! page, :id, :title, :overview, :detail, :created_at, :updated_at
json.url page_url(page, format: :json)
