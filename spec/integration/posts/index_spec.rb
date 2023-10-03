require 'rails_helper'
RSpec.describe 'Post Index', type: :system do
  before(:each) do
    @user = User.create(name: 'Addisalem Seifu',
                        photo: 'https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.webp?b=1&s=170667a&w=0&k=20&c=KtmKHyOE6MJV0w2DiGX8P4399KHNbZ3p8lCjTEabGcY=',
                        bio: 'Full-Stack Software developer', posts_counter: 0)
    @post1 = @user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0,
                                likes_counter: 0)
    @post2 = @user.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0,
                                likes_counter: 0)
    @post3 = @user.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0,
                                likes_counter: 0)
    Comment.create(post: @post1, author: @user, text: 'This is a comment')
    Like.create(post: @post1, author: @user)
  end
  describe 'post page' do
    before(:each) do
      visit(user_posts_path(@user.id))
    end
    it "shows user's profile picture" do
      expect(page.has_xpath?("//img[@src='https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.webp?b=1&s=170667a&w=0&k=20&c=KtmKHyOE6MJV0w2DiGX8P4399KHNbZ3p8lCjTEabGcY=']"))
    end
    it 'shows the users username' do
      expect(page).to have_content('Addisalem Seifu')
    end
    it 'shows number of posts by user' do
      expect(page).to have_content('Number of posts: 3')
    end
    it 'shows posts title' do
      expect(page).to have_content('Post # 1')
    end
    it 'shows some of the posts body' do
      expect(page).to have_content('This is the first post.')
    end
    it 'shows how many comments a post has.' do
      expect(page).to have_content('Comments: 1')
    end
    it 'shows how many likes a post has.' do
      expect(page).to have_content('Likes: 1')
    end
    it 'shows a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end
    # it 'when user clicks on a post, it redirects to that posts show page' do
    #   click_link('Post # 1')
    #   expect(page).to have_current_path user_posts_path(@post1.author_id, @post)
    # end
  end
end
