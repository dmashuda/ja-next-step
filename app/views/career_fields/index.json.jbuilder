json.array!(@career_fields) do |career_field|
  json.extract! career_field, :id, :label, :active
  json.url career_field_url(career_field, format: :json)
end
