class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  has_many :users, through: :likes

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  public

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
