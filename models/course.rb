

class Course
  
  attr_reader :id, :name, :front_9_par, :back_9_par
  
  
  def initialize(course_options={})
    @name = course_options["name"]
    @front_9_par = course_options["front_9_par"]
    @back_9_par = course_options["back_9_par"]
  end
  
  def add_to_database(course_options)
    
    id = CONNECTION.last_insert_row_id
    course_options["id"] = id
    
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
    
    
    
    CONNECTION.execute("INSERT INTO #{table_name} (#{column_names_for_sql}) VALUES (#{values_for_sql});")
   
  end
end