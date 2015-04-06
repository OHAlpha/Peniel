json.array!(@contacts) do |contact|
  json.extract! contact, :id, :home_address_id, :home_phone, :work_phone, :cell_phone, :fax
  json.url contact_url(contact, format: :json)
end
