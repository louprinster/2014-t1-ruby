require './davinci-sinatra.rb'

get "/" do
  halt erb(:enter_first)
end

post "/" do
  # TODO: If no one has that first name, show no_one.html.erb
  # TODO: If one person has that first name, show number.html.erb with
  #       their info.
  # TODO: If 2+ people have that first name, show choose.html.erb
  #       to let the user choose between the people with that first name.

  entered_name = params["first_name"]
  person_list = Person.where(first_name: entered_name)
  count = person_list.size
  
  if count == 0
    halt erb(:no_one)
  elsif count == 1
    @person = Person.find_by(first_name: entered_name)
    halt erb(:number)
  else
    @people = person_list
    halt erb(:choose)
    
  end
end


get "/person/:first/:last" do
  # TODO: Show the info for the person with the first and last name
  #       specified in the route.
  first = params["first"]
  last  = params["last"]
  @person = Person.find_by(first_name: first, last_name: last)
  halt erb(:number)
end

