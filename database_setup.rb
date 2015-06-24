# Load/create our database for this program.
CONNECTION = SQLite3::Database.new("golf.db")

# Make the tables.
CONNECTION.execute("CREATE TABLE IF NOT EXISTS courses (id PRIMARY KEY, name TEXT, front_9_par INTEGER, back_9_par INTEGER);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS golfers (id  PRIMARY KEY, name TEXT, handicap integer);")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS outings (id  PRIMARY KEY, course_id INTEGER, golfer_id INTEGER, front_9_score INTEGER, back_9_score INTEGER);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true