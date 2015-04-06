json.array!(@departments) do |department|
  json.extract! department, :id, :name, :description, :link, :organization_id
  json.url department_url(department, format: :json)
end
