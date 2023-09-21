require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:user) { User.create(name: 'Addisalem Seifu', photo: 'https://i.pravatar.cc/300?u=addisalem', bio: 'A Full-Stack Software developer from Ethiopia.', posts_counter: 0) }
  subject(:post) do
    user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
  end
  describe 'validations' do
    it 'requires presence of text' do
      post = Post.new(text: nil)
      expect(post.valid?).to be_falsey
    end

    it 'requires presence of title' do
      post = Post.new(title: nil)
      expect(post.valid?).to be_falsey
    end

    it 'limits the length of title to 250 characters' do
      post = Post.new(title: 'a' * 251)
      expect(post.valid?).to be_falsey
    end

    it 'requires comments_counter to be an integer greater than or equal to 0' do
      post = Post.new(comments_counter: -1)
      expect(post.valid?).to be_falsey
    end

    it 'requires likes_counter to be an integer greater than or equal to 0' do
      post = Post.new(likes_counter: -1)
      expect(post.valid?).to be_falsey
    end
  end

  describe 'associations' do
    it 'belongs to an author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
      expect(association.class_name).to eq('User')
    end

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

    it 'has many users through likes' do
      association = described_class.reflect_on_association(:users)
      expect(association.macro).to eq(:has_many)
      expect(association.through_reflection.name).to eq(:likes)
    end
  end

  describe '#recent_comments' do
    it 'returns the 5 most recent comments for a given post' do
      6.times do |i|
        post.comments.create(text: "Comment #{i}", author_id: user.id)
      end
      expect(post.recent_comments.count).to eq(5)
      expect(post.recent_comments.first.text).to eq('Comment 5')
      expect(post.recent_comments.last.text).to eq('Comment 1')
    end
  end

  describe '#update_post_counter' do
    it 'updates the posts counter for a user after_save' do
      expect(User.find(user.id).posts_counter).to eq(0)
      post
      expect(User.find(user.id).posts_counter).to eq(1)
    end
  end
end
