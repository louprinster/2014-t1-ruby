require './davinci-sinatra.rb'

get "/" do
  halt erb(:questions)
end

post "/" do
  # TODO: fill out the @answer9 or @answer10 variables in response
  # to whatever the user entered.
  element_name   = params["name_of_element"].capitalize
  element_number = params["number_of_element"]
  if element_name != ""
    @answer9 = Element.find_by(name: element_name).number
  end
  if element_number != ""
    @answer10 = Element.find_by(number: element_number).name
  end
  halt erb(:answer_to_9_or_10)
end
