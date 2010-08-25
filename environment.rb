APP_DIR = File.expand_path File.dirname(__FILE__)
LIB_DIR = File.join APP_DIR, 'lib'
PUBLIC_DIR = File.join APP_DIR, "public"
IMAGE_DIR = File.join PUBLIC_DIR, "images"
MEDIA_DIR = File.join PUBLIC_DIR, "media"
UPLOADS_DIR = File.join MEDIA_DIR, "uploads"
VIEW_DIR = File.join APP_DIR, "views"
SNAPSHOT_DIR = File.join MEDIA_DIR, "snapshots"
LOCAL_GEM_DIR = File.join(APP_DIR, 'vendor', 'gems')
LOG_FILE = File.join APP_DIR, "log", "sinatra.log"

$LOAD_PATH << APP_DIR
$LOAD_PATH << LIB_DIR

# Vendorize all gems in vendor/gems.  Any valid gem with a 'lib' directory will 
# have its contents added to the ruby load path.
Dir.entries(LOCAL_GEM_DIR).each do |dir| 
  gem_lib = File.join LOCAL_GEM_DIR, dir, 'lib'
  $LOAD_PATH << gem_lib if File.exist?(gem_lib)
end

require 'rack' # explicitly require rack to avoid uninitialized constant errors
require 'sinatra/base'
require 'broadcast'
