class Post < ActiveRecord::Base
  has_and_belongs_to_many :keywords
  belongs_to :stakeholder
  has_attached_file :photo,  :default_url =>  '/default_post.png'

  validates :subject, :abstract, :body, :contact_email, :email_subject, :email_body, :stakeholder_id, :presence => true
  validates :active, :inclusion => [true, false]

  validates_attachment :photo,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }
  self.per_page = 20

end
