get "/login_form" do
  erb :"/golfers/login_form"
end

get "/login" do

  @user = Golfer.find_by_email(params["mail"])
  attempted_password = params[:pass]
  actual_password = BCrypt::Password.new(@user.password)
 
  if actual_password == attempted_password
    session["id"] = @user.id
    erb :"/golfers/login_correct"
  else
    erb :"/golfers/login_failure"
  end
  
  
  
end

get "/logout" do
  session["id"] = nil
  
  erb :"/golfers/logout"
end


get "/add_golfer_form" do
  erb :"/golfers/add_golfer_form"
end

get "/add_golfer" do
  
  golfer_options = {"name" => params["name"], "email" =>params["email"], "password" => params["password"], "handicap" => 0}
  
  
  Golfer.create(golfer_options)
  
  
  erb :"/golfers/add_golfer"
end

get "/remove_golfer_form" do
  erb :"/golfers/remove_golfer_form"
end

get "/remove_golfer" do
  
  if Golfer.remove_golfer(params["golfer_id"].to_i)
    erb :"/golfers/remove_golfer"
  else
    erb :"/golfers/remove_golfailure"
  end
  
end

get "/update_golfer_form" do
  erb :"/golfers/update_golfer_form"
end

get "/update_golfer" do
  
  Golfer.save(params["name"], params["golfer_id"].to_i)
  erb :"/golfers/update_golfer"
end

get "/save_golfer/:x" do

 
  erb :"/golfers/save_success"
end

get "/handicap_form" do
  erb :"/golfers/handicap_form"
end

get "/handicap" do
  Golfer.total_handicap(params["golfer_id"].to_i)
  
  
  erb :"/golfers/handicap"
end