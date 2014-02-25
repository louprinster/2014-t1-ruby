require './davinci-sinatra.rb'

get "/" do
  @patients = Patient.order(:id)
  halt erb(:index)
end

get "/patients/:id" do
  id       = params["id"]
  @patient = Patient.find(id)
  halt erb(:edit)
end

post "/patients/:id" do
  id                 = params["id"]
  @patient           = Patient.find(id)
  @patient.systolic  = params["systolic"]
  @patient.diastolic = params["diastolic"]

#  raise params["commit"].inspect   
  
  if params["commit"] == "Update"
    if @patient.save == true
      redirect "/"
    else
      halt erb(:edit)
    end
  elsif params["commit"] == "Delete"
     @patient.destroy
     redirect "/"
  end
end
