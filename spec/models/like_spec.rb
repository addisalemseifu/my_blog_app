require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) { User.create(name: 'Addisalem Seifu', photo: 'https://i.pravatar.cc/300?u=addisalem', bio: 'A Full-Stack Software developer from Ethiopia.', posts_counter: 0) }
  subject(:post) do
    user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
  end
  subject(:like) { user.likes.create(post_id: post.id) }
  describe 'associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('User')
    end

    it 'belongs to a post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('Post')
    end
  end

  describe '#update_like_counter' do
    it 'updates the likes counter for a post' do
      expect(Post.find(post.id).likes_counter).to eq(0)
      like
      expect(Post.find(post.id).likes_counter).to eq(1)
    end
  end
end
