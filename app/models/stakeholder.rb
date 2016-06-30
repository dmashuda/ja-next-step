class Stakeholder < ActiveRecord::Base
  has_one :profile
  has_many :users
end
