class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper 

  private

  def require_admin
    unless current_user.is_admin?
      flash[:danger] = t "Not Admin"
      redirect_to root_path
    end
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please Login"
      redirect_to root_path
    end
  end
end
