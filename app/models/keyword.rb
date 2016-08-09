class Keyword < ActiveRecord::Base
  has_and_belongs_to_many :stakeholders
  has_and_belongs_to_many :career_fields
  has_and_belongs_to_many :posts
  validates :label, presence: true


  def self.search(search)
    if search
      where("label LIKE ?", "%#{search}%")
    else
      find(:all)
    end
  end
end
