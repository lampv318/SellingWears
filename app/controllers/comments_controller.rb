class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      flash[:success] = "success"
    else
      flash[:danger] = "can't save"
    end
    redirect_to root_url
  end

  def destroy
    @comment.destroy
    flash[:success] =  "Delete"
    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit :content,:product_id, :user_id
  end

  def correct_user
    @comment = current_user.comment.find_by id: params[:id]
    redirect_to :back if @comment.nil?
  end
end
