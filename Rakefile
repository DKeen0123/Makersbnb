require 'pg'

task :setup do
  puts "Creating databases..."
  ["bnb_development", "bnb_test"].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")
  end
end
