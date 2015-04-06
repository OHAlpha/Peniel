json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :head_id, :assistant_id, :members_id
  json.url organization_url(organization, format: :json)
end
