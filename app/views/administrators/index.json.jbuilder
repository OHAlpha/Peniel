json.array!(@administrators) do |administrator|
  json.extract! administrator, :id, :user_id, :description, :permissions
  json.url administrator_url(administrator, format: :json)
end
