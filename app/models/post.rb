class Post < ActiveRecord::Base
  has_and_belongs_to_many :keywords
  belongs_to :stakeholder
  has_attached_file :photo

  validates :subject, :abstract, :body, :contact_email, :email_subject, :email_body, :active, :stakeholder_id, :presence => true

  validates_attachment :photo,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }
  self.per_page = 20

  def self.search(keyword_ids)
    if keyword_ids
      results = where(nil)

      for keyword_id in keyword_ids
        results = results.where('id IN (SELECT keyword_post.post_id FROM keyword_post WHERE keyword_id=?)', keyword_id)
      end

      results
    else
      find(:all)
    end
  end

end
