class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = Post.where(author_id: @user_id)
  end

  def show
    @post = Post.find(params[:id])
  end
end
