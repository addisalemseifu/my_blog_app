require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:each) do
    @user = User.create(name: 'John Doe', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', posts_counter: 0)
  end
  context 'GET /index' do
    it 'returns http success' do
      get '/users/'
      expect(response).to have_http_status(:success)
    end

    it 'render the index template' do
      get '/users/'
      expect(response).to render_template('users/index')
    end
  end

  context 'GET /show' do
    it 'returns http success' do
      get "/users/#{@user.id}"
      expect(response).to have_http_status(:success)
    end

    it 'render the show template' do
      get "/users/#{@user.id}"
      expect(response).to render_template('users/show')
    end

    it 'includes the correct placeholder text' do
      get "/users/#{@user.id}"
      expect(response.body).to include('Number of posts: 0')
    end
  end
end
