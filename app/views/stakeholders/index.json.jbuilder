json.array!(@stakeholders) do |stakeholder|
  json.extract! stakeholder, :id
  json.url stakeholder_url(stakeholder, format: :json)
end
