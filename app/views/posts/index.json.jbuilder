json.array!(@posts) do |post|
  json.extract! post, :id, :photo, :subject, :start_date, :end_date, :abstract, :body, :contact_email, :email_subject, :email_body, :active, :created_at, :updated_at

  json.stakeholder do
    json.name post.stakeholder.name
  end

  json.profile do
    json.logo post.stakeholder.profile.logo
  end
end

