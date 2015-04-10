json.array!(@maintainers) do |maintainer|
  json.extract! maintainer, :id, :user_id, :description, :permissions
  json.url maintainer_url(maintainer, format: :json)
end
