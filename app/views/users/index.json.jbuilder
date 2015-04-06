json.array!(@users) do |user|
  json.extract! user, :id, :unom, :email, :passhash, :salt, :name_t, :name_f, :name_m, :name_l, :name_s, :status, :contact_id, :birthdate
  json.url user_url(user, format: :json)
end
