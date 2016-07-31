class Stakeholder < ActiveRecord::Base
  has_one :profile
  has_many :users
  has_and_belongs_to_many :keywords
  has_many :posts

  self.per_page = 10
end
