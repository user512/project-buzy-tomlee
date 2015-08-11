# get "/dashboard" do
#   @post = Post.all
#   erb :dashboard
# end


get "/dashboard/:username" do
  if session[:user_id]
    @user = User.find_by(username: params[:username])
    @username = params[:username]
    @posts = Post.all
    @sorted_post = @posts.sort {|a,b| b.vote <=> a.vote}
    erb :dashboard
  else
    redirect '/'
  end
end

get "/dashboard/:username/post/new" do
  @user = User.find_by(username: params[:username])
  erb :new
end

get "/dashboard/:username/post/:post_id" do
  if session[:user_id]
    @user = User.find_by(username: params[:username])
    @post = Post.find_by(id: params[:post_id])
    @username = params[:username]
    erb :post
  else
    redirect '/'
  end
end

get "/post/:post_id/vote" do
  @posts = Post.all
  @user = User.find_by(id: session[:user_id])
  @post = Post.find_by(id: params[:post_id])
  @post.vote += 1
  @post.save
  @post.vote.to_json
  # redirect "/dashboard/#{@user.username}"
end

post "/dashboard/:username/post/new" do
  if session[:user_id]
    @user = User.find_by(username: params[:username])
    Post.create(title: params[:title], content: params[:content], user_id: session[:user_id], latitude: params[:latitude], longitude: params[:longitude])
    redirect "/dashboard/#{params[:username]}"
  else
    redirect '/'
  end
end

