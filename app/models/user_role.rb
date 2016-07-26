class UserRole < ActiveRecord::Base
  enum role: {
      admin: 0,
      stakeholder_admin: 1
  }
  belongs_to :user
end
