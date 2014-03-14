require './davinci-sinatra.rb'

# Users always expect a route at / so redirect them to where we want
get "/" do
  redirect "/login"
end

# Setup GET route for registration form
get "/users/new" do

  # Define @user so new.html.erb view can use it to pre-fill in blanks
  @user = User.new

  halt erb(:new)
end

# TODO: Write POST route for handling registration form submissions
post "/users/new" do
  @user = User.new
  @user.username = params["username"]
  @user.password = params["password"]
  @user.password_confirmation = params["password_confirmation"]
  
  if @user.save == true
    redirect "/login"
  else
    halt erb(:new)
  end
end

# Setup GET route for login form
get "/login" do
  halt erb(:login)
end

# TODO: Write POST route to handle login form submissions

post "/login" do
  @user = User.find_by(username: params["username"])
  if @user != nil
    attempted_password = params["password"]
    if @user.authenticate(attempted_password) != false
      session[:user_id] = @user.id
      halt erb(:welcome)
    else
      @message = "Incorrect password"
      halt erb(:login)
    end
  else
    @message = "Username does not exist"
    halt erb(:login)
  end  
end

# An example page that's accessible only after you're logged in
get "/welcome" do
  # Get the user_id out of the session
  user_id = session[:user_id]

  # Look up the user row with that id
  @user = User.find(user_id)

  halt erb(:welcome)
end

# TODO: Write handler for GET /logout route, to clear the session.
get "/logout" do
  session.clear
  redirect "/login"
end