class Stakeholder < ActiveRecord::Base
  has_one :profile
  has_many :users
  has_and_belongs_to_many :keywords
end
