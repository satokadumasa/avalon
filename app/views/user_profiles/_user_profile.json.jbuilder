json.extract! user_profile, :id, :user_id, :first_name, :last_name, :pref_code, :postal_code, :address, :self_introduction, :created_at, :updated_at
json.url user_profile_url(user_profile, format: :json)
