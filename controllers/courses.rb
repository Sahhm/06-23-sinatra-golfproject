get "/add_course_form" do
  
  erb :"courses/add_course_form"
end

get "/add_course" do
  
  
  
  course_object = Course.new
  
  
  course_object.add_to_database(params["name"], params["front"].to_i, params["back"].to_i)
  

  
  erb :"courses/add_course"
end