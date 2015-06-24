

class Course
  
  attr_reader :id
  attr_accessor :name, :front_9_par, :back_9_par
  
  
  def initialize(course_options={})
    @name = course_options["name"]
    @front_9_par = course_options["front_9_par"]
    @back_9_par = course_options["back_9_par"]
  end
  
  def add_to_database(name, front, back)
    
    CONNECTION.execute("INSERT INTO courses (name, front_9_par, back_9_par) VALUES ('#{name}', #{front}, #{back});")
    @id = CONNECTION.last_insert_row_id
          
   
  end
end