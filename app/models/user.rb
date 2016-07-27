class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :stakeholder
  has_many :user_roles

  def is_admin?
    self.user_roles.find_by_role(UserRole.roles[:admin]).nil?
  end

  def is_stakeholder_admin?
    self.user_roles.find_by_role(UserRole.roles[:stakeholder_admin]).nil?
  end

  self.per_page = 10
end
