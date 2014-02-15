require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/elements/:route" do
  id = params["route"]
  @element = Element.find(id) 
  halt erb(:show)
end