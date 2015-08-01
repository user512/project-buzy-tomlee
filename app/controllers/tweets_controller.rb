#---- CREATE TWEET ------
post '/users/:user_id/tweets' do
  Tweet.create(
    user_id: params[:user_id],
    body: params[:body]
    )
  redirect "/users/#{params[:user_id]}"
end

get '/users/:user_id/tweets/new' do

  erb :'tweets/new'
end


# Take this to the user controller. its here to avoid a MC

