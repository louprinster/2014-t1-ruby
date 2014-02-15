require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

get "/ufo-sightings/:route" do
  id = params["route"]
  @sighting = UfoSighting.find(id)
  halt erb(:show)
end