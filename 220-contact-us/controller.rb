require './davinci-sinatra.rb'

get "/" do
  halt erb(:index)
end

# TODO: write POST handler
post "/" do
  @message = Message.new
  @message.subject = params["subject"]
  @message.body = params["body"]
  @message.save!
  redirect "/"
end
