require './davinci-sinatra.rb'

get "/" do
  halt erb(:login)
end

# TODO: Write a POST handler that either:
#   1. Shows the login page again with an error "Unknown username"
#   2. Or shows the login page again with the error "Wrong pin number"
#      (Bonus: pre-fill the username that the user entered last time)
#   3. Or redirects to /success

post "/" do
  entered_username    = params["username"]
  entered_pin_number  = params["pin_number"]
  user = User.find_by(username: entered_username)
  if user == nil
    @error = "Unknown username"
    @old_username = entered_username
    halt erb(:login)
  elsif user.pin_number != entered_pin_number
    @error        = "Wrong pin number"
    @old_username = entered_username
    halt erb(:login)
  else
    redirect "/success"
  end
end

get "/success" do
  halt erb(:success)
end
