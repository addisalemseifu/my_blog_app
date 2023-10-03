require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
  before(:each) do
    @user = User.create(name: 'Addisalem Seifu',
                        photo: 'https://media.istockphoto.com/id/1406197730/photo/portrait-of-a-young-handsome-indian-man.webp?b=1&s=170667a&w=0&k=20&c=KtmKHyOE6MJV0w2DiGX8P4399KHNbZ3p8lCjTEabGcY=',
                        bio: 'Full-Stack Software developer', posts_counter: 0)
    @user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0, likes_counter: 0)
  end

  describe 'User show page' do
    before(:each) { visit user_path(id: @user.id) }

    it 'displays a container for the users' do
      expect(page).to have_css('div.user-container')
    end

    it "displays the user's profile picture" do
      expect(page.has_xpath?("//img[@src = '#{@user.photo}' ]"))
    end

    it "displays the user's username" do
      expect(page).to have_content(@user.name)
      click_link('See all posts')
      visit "/users/#{@user.id}/posts/"
      expect(page).to have_current_path("/users/#{@user.id}/posts/")
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content("Number of posts: #{@user.posts.count}")
    end

    it "shows the user's bio" do
      expect(page).to have_content('Bio')
      expect(page).to have_content(@user.bio)
    end

    it 'has a button to view all user posts' do
      click_link('See all posts')
      visit "/users/#{@user.id}/posts/"
      expect(page).to have_current_path("/users/#{@user.id}/posts/")
    end

    it 'redirects to open all posts of a user' do
      click_link('See all posts')
      expect(page).to have_current_path("/users/#{@user.id}/posts/")
    end

    it 'redirects to the posts show page' do
      click_link('Post # 1')
      expect(page).to have_current_path("/users/#{@user.id}/posts/#{@user.recent_posts[0].id}")
    end

    it 'shows the first 3 posts of the user' do
      @user.recent_posts.each_with_index do |post, index|
        expect(page).to have_content("Post # #{index + 1}")
        expect(page).to have_content(post.text)
      end
    end
  end
end
