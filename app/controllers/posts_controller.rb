class PostsController < ApplicationController
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = Post.where(author_id: @user_id)
  end

  def show
    @user_id = params[:user_id]
    @post = Post.find(@user_id)
    @comments = @post.comments
  end
end
