require_relative "ClassMethods.rb"
require_relative "InstanceMethods.rb"
require "bcrypt"

class Golfer 
  
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  include BCrypt
  
  attr_reader :id
  attr_accessor :name, :handicap, :password, :email
  
  def initialize(outing_options = {})
    
    @id = outing_options["id"]
    @name = outing_options["name"]
    @handicap = outing_options["handicap"]
    @email = outing_options["email"]
    @password = outing_options["password"]
   
  end
  
  
  def self.password
      @password ||= Password.new(password_hash)
  end
  
  def self.password=(new_password)
      @password = Password.create(new_password)
      self.password_hash = @password
  end
  
  def self.create(golfer_options)
    @user = Golfer.new(golfer_options)
    golfer_options["password"] = BCrypt::Password.create(golfer_options["password"])
    
    Golfer.add(golfer_options)
  end
  
  def self.find_by_email(mail)
    
    
    results = self.new(CONNECTION.execute("SELECT * FROM golfers WHERE email = '#{mail}';").first)
   
   return results
  end
  
  def login(mail, pass)
    @user = Golfer.find_by_email(mail)
    if @user.password == pass
      give_token
    else
      false
    end
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
  def self.save(new_name, new_email, new_password, golfer_id)
    CONNECTION.execute("UPDATE golfers SET name = '#{new_name}', email = '#{new_email}', password = '#{new_password}' WHERE id = #{golfer_id};")
     
    return self
  end
  
  #method turns new inputs into arguments to update a single line of a database
  def self.save(new_name, new_email, new_password, golfer_id)
    CONNECTION.execute("UPDATE golfers SET name = '#{new_name}', email = '#{new_email}', password = '#{new_password}' WHERE id = #{golfer_id};")
     
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