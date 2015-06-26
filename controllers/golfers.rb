get "/add_golfer_form" do
  erb :"/golfers/add_golfer_form"
end

get "/add_golfer" do
  
  golfer_options = {"name" => params["name"], "handicap" => 0}
  
  
  Outing.add(golfer_options)
  erb :"/outings/add_outing_form"
end