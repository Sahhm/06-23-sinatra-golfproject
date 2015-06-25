




get "/all_courses" do
  
  erb :"courses/all_courses"
  
end

get "/single_course" do
  
  erb :"courses/single_course"
  
end

get "/show_single_course" do 
  @this_course = Course.find(params["course_id"])
  
  erb :"courses/show_single_course"
end

get "/remove_course" do
  
  erb :"courses/remove_course"
end

get "/remove_single_course" do
  
  Course.remove(params["course_id"].to_i)
  
  erb :"courses/remove_single_course"
end

get "/update_course_form" do
  erb :"courses/update_course_form"
end

get "/update_course" do
  erb :"courses/update_course"
end

get "/change_app/:x" do
  
  @entry = Course.find(params["x"].to_i)
  name = params["name"] 
  front_9_par = params["front_9_par"].to_i
  back_9_par = params["back_9_par"].to_i
  binding.pry
  @entry.save
  erb :"courses/save_success"
end

get "/add_course_form" do
  
  erb :"courses/add_course_form"
end

get "/add_course" do
  course_object = Course.new
  course_object.add_to_database(params["name"], params["front"].to_i, params["back"].to_i)
  
  erb :"courses/add_course"
end