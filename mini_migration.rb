require 'sqlite3'
connection = SQLite3::Database.new 'test.db'
connection.execute <<SQL
create table my_table (
  id INTEGER PRIMARY KEY,
  posted INTEGER,
  title VARCHAR(30),
  body VARCHAR(32000));
SQL
