class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render "new"
    end
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes user_params 
      redirect_to root_path
    else
      render "edit"
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  def products
    @user = User.find params[:id]
    @products = @user.products.paginate page: params[:page]
    render "wishlist"
  end

  private

    def user_params
      params.require(:user).permit :name, :email, :password, 
        :password_confirmation
    end

    def logged_in_user
      unless logged_in?
        store_location
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find params[:id]
      redirect_to(root_url) unless current_user? @user
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
