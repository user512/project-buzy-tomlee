enable :sessions

get '/' do
  redirect '/login' if !session[:id]
  redirect '/home'
end

get '/home' do
  redirect '/login' if !session[:id]
  @all_tweets_pool = Tweet.all
  erb :home
end

get '/login' do
  erb :login
end

post '/login' do
  @user = current_user(params[:username])
  if @user && password_match?(user: @user, password_attempt: params[:password_attempt])
    session[:id] = @user.id
    redirect "/home"
  else
    redirect '/login?error=true'
  end
end

get '/logout' do
  session[:id] = nil

  redirect '/'
end

get '/signup' do
  # redirect '/home' if logged_in?

  erb :signup
end

post '/signup' do
  p params
  user = User.create(username: params[:username],
              password_hash: params[:password_hash],
              email: params[:email],
              bio: params[:bio])
  user.get_user_image
  redirect '/home'
end

get '/users/:id' do
  @profile_user = User.find(params[:id])

  erb :profile_page
end
