require './davinci-sinatra.rb'

get "/" do
  halt erb(:browse)
end

# TODO: GET handler for routes like /year/2011, /year/2007, etc.

get "/year/:year" do
  search_year = params["year"]
  @books = Book.where(publication_year: search_year)
  @header = "Books by publication year #{search_year}"
  halt erb(:search_results)
end


# TODO: GET handler for routes like /author/Olsen,
#       /author/Crockford, etc.

get "/author/:last_name" do
  search_last_name = params["last_name"]
  @books = Book.where("author ilike ?", "%#{search_last_name}")
  @header = "Books by author #{search_last_name}"
  halt erb(:search_results)
end

# TODO: GET handler for routes like /topic/jQuery, /topic/CSS, etc.

get "/topic/:topic" do
  search_topic = params["topic"]
  @books = Book.where("title ilike ?", "%#{search_topic}%")
  @header = "Books on #{search_topic}"
  halt erb(:search_results)
end

# TODO: GET handler for routes like /isbn/1449397220, 
#       /isbn/1449325947, etc.

get "/isbn/:isbn" do
  search_isbn = params["isbn"]
  @book = Book.find_by(isbn: search_isbn)
  halt erb(:show)
end