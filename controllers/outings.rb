get "/all_outings" do
  erb :"outings/all_outings"
end

get "/add_outing_form" do
  erb :"outings/add_outing_form"
end

get "/add_outing" do
  
  outing_options = {"course_id" => params["course_id"], "golfer_id" => params["golfer_id"], "front_9_score" => params["front"],  "back_9_score" => params["back"]}

  Outing.add(outing_options)
  erb :"outings/add_outing"
end