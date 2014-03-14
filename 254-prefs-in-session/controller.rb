require './davinci-sinatra.rb'

get "/" do
  # TODO: Retrieve three values stored in the session and use them
  # to pre-fill form values in the view.

  @color  = session[:color]
  @letter = session[:letter]
  @number = session[:number]

  halt erb(:index)
end

post "/" do
  # TODO: Transfer values of POST params to become local variables.
  # TODO: Save those local variables to the session so the values
  #       will last.
  if params["commit"] == "Update preferences"
    color  = params["color"]
    letter = params["letter"]
    number = params["number"]
  
    session[:color] = color
    session[:letter] = letter
    session[:number] = number
    
    redirect "/"

  end

end

# TODO: Write handler for GET /logout that empties the session
get "/logout" do
  session.clear
  redirect "/"
end