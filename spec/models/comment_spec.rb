require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:user) { User.create(name: 'Addisalem Seifu', photo: 'https://i.prav.cc/400?u=addisalem', bio: 'A Full-Stack Software developer from Ethiopia.', posts_counter: 0) }
  subject(:post) do
    user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
  end
  subject(:comment) { user.comments.create(post_id: post.id, text: 'This is the first comment.') }

  describe 'validations' do
    it 'requires presence of text' do
      comment = Comment.new(text: nil)
      expect(comment.valid?).to be_falsey
    end
  end

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

  describe '#update_comment_counter' do
    it 'updates the comments counter for a post' do
      expect(Post.find(post.id).comments_counter).to eq(0)
      comment
      expect(Post.find(post.id).comments_counter).to eq(1)
    end
  end
end
