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
  # Load the values that user filled out for the username and password
  # into variables.
  username = params["username"]
#  password = params["password"]
  attempted_password = params["password"]
  
 
  # Look for a row in the users table with that same username
  found_user = User.find_by(username: username)

  # If no row was found for that username...
  if found_user == nil
    # Then set a message to show at the top of the page
    @error = "Unknown username"

    # And render the login page again
    halt erb(:login)

  # Otherwise, if the password was wrong...
#   elsif password != found_user.password
#     # Then set a message to show at the top of the page
#     @error = "Incorrect password"
# 
#     # And render the login page again
#     halt erb(:login)

  elsif found_user.authenticate(attempted_password) == false
    @error = "Incorrect password"
    halt erb(:login)

  # Otherwise... (if the username and password was right)
  else
    # Save that user's id into the session so we'll have it later
    session[:user_id] = found_user.id

    # Redirect to the default page
    redirect "/accounts"
  end # End if
end # End handler

get "/accounts" do
  # Load the user based on the id saved to the session
  @user = User.find_by(id: session[:user_id])

  halt erb(:accounts)
end

get "/location" do
  # Load the user based on the id saved to the session
  @user = User.find_by(id: session[:user_id])

  halt erb(:location)
end

get "/rates" do
  # Load the user based on the id saved to the session
  @user = User.find_by(id: session[:user_id])

  halt erb(:rates)
end

get "/logout" do
  # Throw away the user id saved in the session
  session.clear

  redirect "/login"
end
