get '/register' do
  erb :register
end

post '/register' do
  @new_user = User.new({username: params[:username], password: params[:password]})
  @new_user.save
  errors = nil
  if !(@new_user.errors.empty?)
    errors = @new_user.errors.full_messages
    session[:errors] = errors
  end
  if session[:errors]
    redirect '/register'
  else
    redirect '/login'
  end
end


get '/login' do
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])
    if user
      if user.authenticate(params[:password])
        session[:id] = user.id
        redirect "/games"
      else
        session[:errors] = ["Invalid password"]
        redirect '/login'
      end
    else
      session[:errors] = ["Could not find that user"]
      redirect '/login'
    end
end

get '/logout' do

  session.clear

end

