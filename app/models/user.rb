class User < ApplicationRecord
  has_many :comments
  has_many :likes
  has_many :posts, foreign_key: :author_id
  has_many :liked_posts, through: :likes, source: :post

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
