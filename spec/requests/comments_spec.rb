require 'rails_helper'

RSpec.describe 'Comments', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', posts_counter: 0)
    @post = @user.posts.create(title: 'Hello World', text: 'This is my first post.', comments_counter: 0,
                               likes_counter: 0)
    @comment = @post.comments.create(author_id: @user.id, text: 'This is my first comment.')
  end

  context 'GET /index' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts/#{@post.id}/comments/"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the index template' do
      get "/users/#{@user.id}/posts/#{@post.id}/comments/"
      expect(response).to render_template('comments/index')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}/posts/#{@post.id}/comments/"
      expect(response.body).to include('Here are list of comments for given user and post')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get "/users/#{@user.id}/posts/#{@post.id}/comments/"
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the show template' do
      get "/users/#{@user.id}/posts/#{@post.id}/comments/show"
      expect(response).to render_template('comments/show')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}/posts/#{@post.id}/comments/show"
      expect(response.body).to include('list a comment for given user id, post id')
    end
  end

  context 'POST /new' do
    it 'returns http success' do
      post "/users/#{@user.id}/posts/#{@post.id}/comments/new", params: @User
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the new template' do
      post "/users/#{@user.id}/posts/#{@post.id}/comments/new", params: @User
      expect(response).to render_template('comments/new')
    end

    it 'includes the correct placeholder text' do
      post "/users/#{@user.id}/posts/#{@post.id}/comments/new", params: @User
      expect(response.body).to include('Create new comments')
    end
  end

  context 'POST  /edit' do
    it 'returns http success' do
      post "/users/#{@user.id}/posts/#{@post.id}/comments/edit/#{@comment.id}", params: @User
      expect(response).to have_http_status(:success)
      expect(response.status).to eq(200)
    end

    it 'render the edit template' do
      post "/users/#{@user.id}/posts/#{@post.id}/comments/edit/#{@comment.id}", params: @User
      expect(response).to render_template('comments/edit')
    end

    it 'includes the correct placeholder text' do
      post "/users/#{@user.id}/posts/#{@post.id}/comments/edit/#{@comment.id}", params: @User
      expect(response.body).to include('Edit comments')
    end
  end
end
