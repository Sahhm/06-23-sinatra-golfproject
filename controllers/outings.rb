get "/all_outings" do
  
  @all_outings = Outing.all_join
  erb :"outings/all_outings"
end

get "/add_outing_form" do
  erb :"outings/add_outing_form"
end

get "/add_outing" do
  
  outing_options = {"course_id" => params["course_id"], "golfer_id" => params["golfer_id"], "front_9_score" => params["front"].to_i,  "back_9_score" => params["back"].to_i, "totalscore" => (params["front"].to_i+params["back"].to_i)}

  Outing.add(outing_options)
  erb :"outings/add_outing"
end

get "/leaderboard_form" do
  erb :"outings/leaderboard_form"
end

get "/leaderboard" do
  
  erb :"outings/leaderboard"
end

get "/delete_outing_form" do
  erb :"outings/delete_outing_form"
end

get "/delete_outing" do
  Outing.remove(params["course_id"].to_i)
  
  erb :"outings/delete_outing"
end

get "/update_outing_form" do
  erb :"/outings/update_outing_form"
end

get "/update_outing" do
  
  Outing.save(params["front"].to_i, params["back"].to_i, params["golfer_id"].to_i)
  erb :"/outings/update_outing"
end