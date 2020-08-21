require 'sqlite3'
require 'rulers/sqlite_model'

class MyTable < Rulers::Model::SQLite; end
#STDERR.puts MyTable.schema.inspect

# Create a row
# mt = MyTable.create 'title' => 'I saw it again!'

# mt['title'] = 'I really did!'
# mt.save!

# puts "Last: #{MyTable.find(MyTable.count - 1).inspect}"

# mt2 = MyTable.find mt['id']

last_record = MyTable.find(MyTable.count - 1)

puts "Title: #{last_record['title']}"

puts "Title (via column accessor): #{last_record.title}"
