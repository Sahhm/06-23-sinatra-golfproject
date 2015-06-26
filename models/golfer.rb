require_relative "ClassMethods.rb"
require_relative "InstanceMethods.rb"

class Golfer
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id
  attr_accessor :name, :handicap
  
  def initialize(outing_options = {})
    
    @id = outing_options["id"]
    @name = outing_options["name"]
    @handicap = outing_options["handicap"]
   
  end
  
  #method turns new inputs into arguments to update a single line of a database
  def self.save(front, back, outing_id, golferid, courseid)
    CONNECTION.execute("UPDATE courses SET handicap = #{new_handicap} WHERE id = #{golfer_id};")
     
    return self
  end
  
  
end