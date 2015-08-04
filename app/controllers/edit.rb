get '/dashboard/:username/post/:post_id/edit' do
  @user = User.find_by(username: params[:username])
  @post = Post.find_by(id: params[:post_id])
  erb :edit
end

put '/dashboard/:username/post/:post_id/edit' do
  @user = User.find_by(username: params[:username])
  @post = Post.find_by(id: params[:post_id])
  @post.update(title: params[:title], content: params[:content])
  redirect "/dashboard/#{params[:username]}"
end

delete '/dashboard/:username/post/:post_id/delete' do
  delete_this = Post.find_by(id: params[:post_id])
  delete_this.destroy
  redirect "/dashboard/#{params[:username]}"
end