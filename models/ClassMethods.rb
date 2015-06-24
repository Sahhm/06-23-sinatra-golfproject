require "active_support"
require "active_support/inflector"


module DatabaseClassMethods
  
  def all
    
    table_name = self.to_s.pluralize
  
    results = CONNECTION.execute("SELECT * from #{table_name};")
    
  end
  
  def remove(course_id)
    
      table_name = self.to_s.pluralize.downcase
      
      CONNECTION.execute("DELETE FROM #{table_name} WHERE id = #{course_id};")
    
  end
  
  
  def find(id)
    
    table_name = self.to_s.pluralize
    
    CONNECTION.execute("SELECT * FROM #{table_name} WHERE id = #{id};")
    
  end
  
 
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
  
  