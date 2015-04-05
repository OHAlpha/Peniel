json.array!(@developers) do |developer|
  json.extract! developer, :id, :user_id, :description, :permissions
  json.url developer_url(developer, format: :json)
end
