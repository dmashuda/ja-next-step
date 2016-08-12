class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    stakeholder_url(:id => current_user.stakeholder_id)
  end

  def admin_only
    unless current_user.is_admin?
      redirect_to :root, :alert => 'Access denied. - > Admin role required'
    end
  end
  def stakeholder_admin_only
    unless current_user.is_stakeholder_admin?
      redirect_to :root, :alert => 'Access denied. -> stakeholder admin role required'
    end
  end

end
