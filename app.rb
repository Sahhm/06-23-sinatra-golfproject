require "pry"
require "sinatra"
require "sinatra/reloader"

# SQL/Database
require "sqlite3"
require_relative "database_setup.rb"

# Models
require_relative "models/course.rb"
require_relative "models/golfer.rb"
require_relative "models/outing.rb"

# Controllers
require_relative "controllers/main.rb"
require_relative "controllers/outings.rb"
require_relative "controllers/golfers.rb"
require_relative "controllers/courses.rb"

