# Vendorize all gems in vendor/gems.  Any valid gem with a 'lib' directory will 
# have its contents added to the ruby load path.
APP_DIR = File.expand_path File.dirname(__FILE__)
LOCAL_GEM_DIR = File.join(APP_DIR, 'vendor', 'gems')

$LOAD_PATH << APP_DIR

Dir.entries(LOCAL_GEM_DIR).each do |dir| 
  gem_lib = File.join LOCAL_GEM_DIR, dir, 'lib'
  $LOAD_PATH << gem_lib if File.exist?(gem_lib)
end

puts "loading sinatra"
require 'sinatra/base'
require 'broadcast'

puts "running app"
Broadcast.run!

puts "done"
