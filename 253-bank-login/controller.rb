require './davinci-sinatra.rb'

get "/" do
  redirect "/login"
end

get "/login" do
  # There's no error to show; not necessary, just being clear...
  @error = nil

  halt erb(:login)
end

post "/login" do
  # TODO: Take the username and password that the user entered,
  # and either log them in, saving their user ID to the session,
  # and redirect to /accounts, or set an error message in @error
  # and re-render login.html.erb.

  username = params["username"]
  password = params["password"]

  user = User.find_by(username: username)
  
  if user != nil
      if password == user.password
        session[:user_id] = user.id
        redirect "/accounts"
      else
        @error = "Password not found"
        halt erb(:login)
      end
  else
    @error = "Username not found"
    halt erb(:login)
  end
  
end

get "/accounts" do
#  @user = User.find(1) # TODO: Remove this line
  # TODO: Load the user based on the id saved to the session

  user_id = session[:user_id]
  
  if user_id != nil
    @user = User.find(user_id)
    halt erb(:accounts)
  else # prevent access to this URL without logging in
    @error = "Please login"
    halt erb(:login)
  end
  
end

get "/location" do
#  @user = User.find(1) # TODO: Remove this line
  # TODO: Load the user based on the id saved to the session

  user_id = session[:user_id]
  
  if user_id != nil
    @user = User.find(user_id)
    halt erb(:location)
  else
    @error = "Please login"
    halt erb(:login)
  end
  
end

get "/rates" do
#  @user = User.find(1) # TODO: Remove this line
  # TODO: Load the user based on the id saved to the session

  user_id = session[:user_id]
  
  if user_id != nil
    @user = User.find(user_id)
    halt erb(:rates)
  else
    @error = "Please login"
    halt erb(:login)
  end
  
end

# TODO: Write handler for GET /logout that logs out the user

get "/logout" do
  session.clear
  redirect "/login"
end


