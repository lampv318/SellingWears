class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper 

  private
  
  def check_login
    unless logged_in?
      flash[:danger] = t "login_first"
      redirect_to root_path
    end
  end

  def require_admin
    unless current_user.is_admin?
      flash[:danger] = t "not_admin"
      redirect_to root_path
    end
  end
end
