DATABASE_NAME = 'make-a-meal-database'

require 'sqlite3'

db_connection = SQLite3::Database.new "#{DATABASE_NAME}.db"

db_connection.execute("drop table if exists food;")
db_connection.execute("drop table if exists ingredients;")
db_connection.execute("drop table if exists food_ingredients;")

db_connection.execute( <<-SQL

CREATE TABLE food (
id INTEGER DEFAULT NULL PRIMARY KEY AUTOINCREMENT,
food_item VARCHAR DEFAULT NULL
);
SQL
)

db_connection.execute( <<-SQL
CREATE TABLE ingredients (
id INTEGER DEFAULT NULL PRIMARY KEY AUTOINCREMENT,
ingredient_name VARCHAR DEFAULT NULL,
calories INTEGER DEFAULT NULL
);
SQL
)

db_connection.execute(<<-SQL

CREATE TABLE food_ingredients (
id INTEGER DEFAULT NULL PRIMARY KEY AUTOINCREMENT,
food_id INTEGER DEFAULT NULL REFERENCES food (id),
ingredient_id INTEGER DEFAULT NULL REFERENCES ingredients (id)
);
SQL
)

