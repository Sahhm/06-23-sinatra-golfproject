require_relative "ClassMethods.rb"
require_relative "InstanceMethods.rb"

class Course
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id
  attr_accessor :name, :front_9_par, :back_9_par
  
  #initializes a new course object
  #sets object attributes to whatever was entered
  def initialize(course_options={})
    
    @id = course_options["id"]
    @name = course_options["name"]
    @front_9_par = course_options["front_9_par"]
    @back_9_par = course_options["back_9_par"]
  end
  


  
  #method turns new inputs into arguments to update a single line of a database
  def self.save(new_name, front, back, course_id)
      CONNECTION.execute("UPDATE courses SET name = '#{new_name}', front_9_par = #{front},
       back_9_par = #{back} WHERE id = #{course_id};")
     
      return self
  end
  
end