get '/'do
  @post = Post.all
  @user = User.find_by(username: params[:username])
  erb :index
end

post '/user' do
  if params[:password] == params[:confirm_password]
    @user = User.new
    @user.username = params[:username]
    @user.password = params[:password]
    @user.save
    redirect '/'
  else
    @mismatch_error_message = "These passwords don't match. Try again?"
    # probably not RESTful
    erb :index
  end
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user == nil || @user.password != params[:password]
    @error_message = "Incorrect username or password, please try again."
    erb :index
  elsif @user.password == params[:password]
    session[:user_id] = @user.id
    # redirect '/testing'
    redirect "/dashboard/#{params[:username]}"
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end