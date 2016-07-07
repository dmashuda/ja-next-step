class Post < ActiveRecord::Base
  has_and_belongs_to_many :keywords
  belongs_to :stakeholder
end
