class UserRole < ActiveRecord::Base
  enum role: [:stakeholder_admin, :admin]
  belongs_to :user
end
