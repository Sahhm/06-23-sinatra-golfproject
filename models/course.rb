require_relative "ClassMethods.rb"
require_relative "InstanceMethods.rb"

class Course
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id
  attr_accessor :name, :front_9_par, :back_9_par
  
  
  def initialize(course_options={})
    @id = course_options["id"]
    @name = course_options["name"]
    @front_9_par = course_options["front_9_par"]
    @back_9_par = course_options["back_9_par"]
  end
  
  def add_to_database(name, front, back)
    
    CONNECTION.execute("INSERT INTO courses (name, front_9_par, back_9_par) VALUES ('#{name}', #{front}, #{back});")
    @id = CONNECTION.last_insert_row_id
          
   
  end
  
  def self.remove_object(course_id)
    
    CONNECTION.execute("SELECT * FROM courses WHERE id = #{course_id};")
    
  end
  
  def self.save
      CONNECTION.execute("UPDATE courses SET name = '#{self.name}', front_9_par = #{self.front_9_par},
       back_9_par = #{self.back_9_par} WHERE id = #{self.id};")
     
       return self
    end
  
  
  
  def self.all_as_objects
    
    results = Course.all
    
    results_as_objects = []
    
    results.each do |result_hash|
    
      results_as_objects << Course.new(result_hash)
   
    
    end
    
    return results_as_objects
    
    
  end
  
end