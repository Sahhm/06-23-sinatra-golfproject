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
  
  def self.remove_golfer(gid)
    result = CONNECTION.execute("SELECT id, course_id, totalscore FROM outings WHERE golfer_id = #{gid};")
    if result == []
      CONNECTION.execute("DELETE FROM golfer WHERE id = #{gid};")
    else
      false
    end
  end
  
  #method turns new inputs into arguments to update a single line of a database
  def self.save(new_name, golfer_id)
    CONNECTION.execute("UPDATE golfers SET name = '#{new_name}' WHERE id = #{golfer_id};")
     
    return self
  end
  
  
end