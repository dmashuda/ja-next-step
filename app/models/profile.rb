class Profile < ActiveRecord::Base
  belongs_to :stakeholder

  has_attached_file :logo
  has_attached_file :banner

  validates_attachment :logo,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }

  validates_attachment :banner,
                       content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }

end
