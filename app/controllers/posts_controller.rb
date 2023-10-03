class PostsController < ApplicationController
  before_action :find_user, only: %i[index show new edit create]
  def index
    @posts = Post.includes(:author).references(:author).where('author_id= ?', params[:user_id])
    @comment = @user.posts.includes(:comments)
  end

  def show
    @user_id = params[:user_id]
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user_id = params[:user_id]
    @user = User.find(@user_id)
    @post = Post.new(post_params)
    @post.author = @user
    @post.comments_counter = 0
    @post.likes_counter = 0

    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post created successfully'
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
