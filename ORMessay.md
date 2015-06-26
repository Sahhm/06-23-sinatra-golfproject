##Assignment

###Answer the following questions:

- What is an ORM?
- How does your ORM help you get all of a particular table's rows from the database?
- How does your ORM represent rows from a table, given that Ruby doesn't have a Table data structure?
- How does your ORM convert rows from a table into the Ruby data structure (which you identified in the previous question)?


ORM stands for Object Relational Model.  It is a way for a language like ruby to integrate database functionality from SQL into a ruby(or other language I think) based program.

MY ORM helps me get all of a table's rows from the database using the 'all_as_objects' method in my ClassMethods module.

```ruby
  def all_as_objects
    table_name = self.to_s.pluralize
      
    results = CONNECTION.execute("SELECT * FROM #{table_name};")
```
This method first gets the table name, by taking whatever Class called the method and pluralizes its name.  Then it does a SELECT query in SQL to get all of the information from the given table.  


ORM's represent rows from tables in the database as arrays of hashes.  The table name is the key of the hash with the values of the hash being the data in each row. i.e. a Table with column names ID, and Student would return an array like [{ID => 1, Student => "Sam"}, {ID => 2, Student => "Phil"}].  This can be turned into a ruby object with code like below where it creates an empty array that has the results of the SELECT query pushed into it in the results.each method.  Each hash from the table query is turned into an object with the Course.new(result_hash) line where a new Course object is created with the results of the hash as attributes for the object.

```ruby
  
    results_as_objects = []
    
    results.each do |result_hash|
    
      results_as_objects << Course.new(result_hash)
   
    
    end
    
      return results_as_objects
    
    
  end

```




