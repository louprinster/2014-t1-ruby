require './davinci-sinatra.rb'

# TODO: Write handler for GET /

# TODO: Write handler for POST /


get "/" do
    @employees = Employee.order(:id)
    @new_employee = Employee.new
    halt erb(:index)
end

post "/" do
    @employees = Employee.order(:id)
    @new_employee = Employee.new
    @new_employee.first_name = params["first_name"]
    @new_employee.last_name  = params["last_name"]
    @new_employee.company_id = params["company_id"]
    if @new_employee.save == true
      redirect "/"
    else
      halt erb(:index)
    end
end