require File.join(File.dirname(__FILE__), 'environment')

puts "running app"

Broadcast.run!

puts "done"
