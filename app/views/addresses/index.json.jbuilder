json.array!(@addresses) do |address|
  json.extract! address, :id, :house_number, :street, :apt_number, :city, :county, :state, :country, :zip, :zip_ext
  json.url address_url(address, format: :json)
end
