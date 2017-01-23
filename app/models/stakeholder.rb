class Stakeholder < ActiveRecord::Base
  has_one :profile
  has_many :users
  has_and_belongs_to_many :keywords
  has_many :posts
  after_create :postCreate

  self.per_page = 10

  def postCreate
    create_profile(email: 'placeholder@placeholder.com' )
  end
end
