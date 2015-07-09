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
  
  def self.total_handicap(golfer)
    
    results = CONNECTION.execute("SELECT golfers.name AS golfer, courses.front_9_par AS frontpar, courses.back_9_par AS backpar, outings.front_9_score AS frontscore, outings.back_9_score AS backscore FROM outings LEFT JOIN courses ON outings.course_id = courses.id LEFT JOIN golfers ON outings.golfer_id = golfers.id WHERE golfer = '#{golfer}';")
    results_as_objects = []
   
    results.each do |result_hash|
   
      results_as_objects << self.new(result_hash)
  
    end
   
   return results_as_objects
    
  end
  
  def rounds_played(golfid)
    rounds = CONNECTION.execute("SELECT COUNT (id) FROM outings where golfer_id=#{golfid};")
  
    return rounds
  end
  
 
  

  
  
  
  
end