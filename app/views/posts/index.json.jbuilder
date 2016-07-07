json.array!(@posts) do |post|
  json.extract! post, :id, :subject, :start_date, :end_date, :abstract, :body, :contact_email, :email_subject, :email_body, :active
  json.url post_url(post, format: :json)
end
