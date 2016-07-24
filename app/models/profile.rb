class Profile < ActiveRecord::Base
  belongs_to :stakeholder

  validates :email, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ ,
                                 :message => 'Invalid e-mail! Please provide a valid e-mail address'}
  validates :email, presence: true

  has_attached_file :logo
  has_attached_file :banner

  validates_attachment :logo,
                       content_type: {content_type: ['image/jpeg', 'image/gif', 'image/png']}

  validates_attachment :banner,
                       content_type: {content_type: ['image/jpeg', 'image/gif', 'image/png']}

end
