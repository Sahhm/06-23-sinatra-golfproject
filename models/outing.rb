require_relative "ClassMethods.rb"
require_relative "InstanceMethods.rb"

class Outing
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_reader :id
  attr_accessor :golfer_id, :course_id, :front_9_score, :back_9_score
  
  def initialize(outing_options = {})
    @id = outing_options["id"]
    @golfer_id = outing_options["golfer_id"]
    @course_id = outing_options["course_id"]
    @front_9_score = outing_options["front_9_score"]
    @back_9_score = outing_options["back_9_score"]
  end
  
  #method turns new inputs into arguments to update a single line of a database
  def self.save(front, back, outing_id, golferid, courseid)
    CONNECTION.execute("UPDATE outings SET front_9_score = #{front}, back_9_score = #{back} WHERE id = #{outing_id} AND golfer_id = #{golferid} AND course_id = #{courseid};")
     
    return self
  end
  
  
end