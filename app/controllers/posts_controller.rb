class PostsController < ApplicationController
  before_action :find_user, only: %i[index show new edit create]
  def index
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @posts = Post.where(author_id: @user_id)
  end

  def show
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @post = @user.posts.find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(current_user), notice: 'Post created successfully'
    else
      flash.now[:alert] = @post.errors.full_messages.first if @post.errors.any?
      render :new, status: 400
    end
  end

  private

  def find_user
    @user = User.includes(:posts, posts: [:comments, { comments: [:author] }]).find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text, :comments_counter, :likes_counter)
  end
end
