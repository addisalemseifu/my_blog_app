require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'Addisalem Seifu', photo: 'https://i.pra.cc/400?u=addisalem',
                bio: 'Full-Stack software developer from Ethiopia', posts_counter: 0)
  end
  describe 'validations' do
    it 'requires presence of photo' do
      user = User.new(photo: nil)
      expect(user.valid?).to be_falsey
    end

    it 'requires presence of bio' do
      user = User.new(bio: nil)
      expect(user.valid?).to be_falsey
    end

    it 'requires presence of name' do
      user = User.new(name: nil)
      expect(user.valid?).to be_falsey
    end

    it 'requires posts_counter to be an integer greater than or equal to 0' do
      user = User.new(posts_counter: -1)
      expect(user.valid?).to be_falsey
    end
  end

  describe 'associations' do
    it 'has many comments' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
      expect(association.class_name).to eq('Comment')
    end

    it 'has many likes' do
      association = described_class.reflect_on_association(:likes)
      expect(association.macro).to eq(:has_many)
      expect(association.class_name).to eq('Like')
    end

    it 'has many posts' do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq(:has_many)
      expect(association.class_name).to eq('Post')
    end

    it 'has many liked_posts through likes' do
      association = described_class.reflect_on_association(:liked_posts)
      expect(association.macro).to eq(:has_many)
      expect(association.through_reflection.name).to eq(:likes)
    end
  end

  describe '#recent_posts' do
    it 'returns the most recent 3 posts' do
      subject.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0, likes_counter: 0)
      subject.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0, likes_counter: 0)
      recent_posts = subject.recent_posts
      expect(recent_posts.length).to eq(3)
    end
  end
end
