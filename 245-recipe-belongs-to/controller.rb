require './davinci-sinatra.rb'

get "/" do
  @recipes = Recipe.order(:id).all
  @title = "All recipes"
  halt erb(:index)
end

get "/recipe/:name" do
  name = params["name"]
  @recipe = Recipe.find_by(name: name)
  halt erb(:show)
end

# Add handler for routes like GET /by-author/Jim and GET /by-author/Jen

get "/by_author/:first_name" do
  author_name = params["first_name"]
  author = Author.find_by(first_name: author_name)
  @recipes = author.recipes
  @title = "Recipes by #{author_name}"
  halt erb(:index)
end