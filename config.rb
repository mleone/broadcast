require File.join(File.dirname(__FILE__), 'environment')

log = File.new LOG_FILE, "a"
$stderr.reopen log

puts "running app"

Broadcast.run!

puts "done"
