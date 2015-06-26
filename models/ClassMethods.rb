require "active_support"
require "active_support/inflector"


module DatabaseClassMethods
  

    
   
  #method pluralizes a class' name into a table name
  #method finds a single row from the table
  #returns an object
  def find(id)
    
    table_name = self.to_s.pluralize
    
    self.new(CONNECTION.execute("SELECT * FROM #{table_name} WHERE id = #{id};").first)
   
  end
   
  #method pluralizes a class' name into a table name
  #selects all of the data from that table
  #returns an array of objects
  def all_as_objects
    table_name = self.to_s.pluralize
      
    results = CONNECTION.execute("SELECT * FROM #{table_name};")
    
    results_as_objects = []
    
    results.each do |result_hash|
    
      results_as_objects << Course.new(result_hash)
   
    end
    
    return results_as_objects
    
  end


  #method pluralizes a class' name into a table name
  #then removes item from table corresponding to argument
  def remove(this_id)
    
    table_name = self.to_s.pluralize
    
    CONNECTION.execute("SELECT * FROM #{table_name} WHERE id = #{this_id};")
    
  end
  
  #method pluralizes a class' name into a table name
  #takes an array of hashes into objects that can be added to a table
  def add(options)



    column_names = options.keys
      
    values = options.values
      
    column_names_for_sql = column_names.join(", ")
      
    individual_values_for_sql = []
      
    values.each do |value|
      if value.is_a?(String)
        individual_values_for_sql << "'#{value}'"
      else
        individual_values_for_sql << value
      end
    end
      
    values_for_sql = individual_values_for_sql.join(", ")
      
    table_name = self.to_s.pluralize
      
      
      
    results = CONNECTION.execute("INSERT INTO #{table_name} (#{column_names_for_sql}) VALUES (#{values_for_sql});")
      
      
    id = CONNECTION.last_insert_row_id
    options["id"] = id
      
    self.new(options)
      

  end
  
end
  
  