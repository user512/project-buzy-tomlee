# require 'pry'
# require 'pry-byebug'

require_relative 'spec_helper'

describe "user_controller" do

  describe 'GET /login' do
    it 'returns 200 status' do
      get '/login'
      expect(last_response.status).to eq(200)
    end

    it 'displays a login prompt' do
      get '/login'
      expect(last_response.body).to include("Log In")
    end

    it 'displays an error message if previous login was incorrect' do
      get '/login?error=true'
      expect(last_response.body).to include("Not a valid")
    end

    # xit 'redirects to home page if user already logged in' do
    #   User.create() # create user
    #   # log that user in
    #   get '/login'
    #   expect(last_response).to be_redirect
    #   follow_redirect!
    #   expect(last_request.url).to eq(#expected url)
    # end

  end


  describe 'POST /login' do
    before(:all) do
      User.where(username: "Bob").each { |record| record.destroy }
    end
    let(:test_user) { User.create(username: "Bob", email: "Bob@bob.com", password_hash: "1234") }

    it 'returns 302 status' do
      post '/login'
      expect(last_response.status).to eq(302)
    end

    it 'redirects to /login?error=true in case of failed login attempt' do
      post '/login'
      follow_redirect!
      expect(last_request.url).to eq('http://example.org/login?error=true')
    end

    it 'redirects to /users/:user_id in case of successful login' do
      post '/login', params = { username: test_user.username,
                                password_hash: test_user.password_hash }
      follow_redirect!
      expect(last_request.url).to eq("http://example.org/users/#{test_user.id}")
    end
  end

# pending 'GET /signup' do
#   it 'returns 200 status' do
#     get '/login'
#     expect(last_response.status).to eq(200)
#   end
# end


# pending 'GET /' do
#   it 'returns 200 status' do
#     get '/login'
#     expect(last_response.status).to eq(200)
#   end
# end


# pending 'POST /logout' do
#   it 'returns 200 status' do
#     get '/login'
#     expect(last_response.status).to eq(200)
#   end
# end


end
