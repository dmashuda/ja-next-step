class Keyword < ActiveRecord::Base
  has_and_belongs_to_many :stakeholders
  has_and_belongs_to_many :career_fields
  has_and_belongs_to_many :posts
end
