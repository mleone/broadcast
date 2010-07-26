# Vendorize all gems in vendor/gems.  Any valid gem with a 'lib' directory will 
# have its contents added to the ruby load path.
LOCAL_GEM_DIR = File.join(File.dirname(__FILE__), 'vendor', 'gems')

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
