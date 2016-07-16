class Post < ActiveRecord::Base
  has_and_belongs_to_many :keywords
  belongs_to :stakeholder
  has_attached_file :photo

  validates_attachment :photo,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }
end
