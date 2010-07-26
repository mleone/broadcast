require "android"

class Broadcast < Sinatra::Base 
  get '/' do
    "good"
=begin
    content_type 'image/png'
    droid = Android.new
    droid.cameraCapturePicture "/tmp/pic"
    pic = File.open("/tmp/pic", "r")
    image_data = pic.read
    pic.close
    File.delete "/tmp/pic"
    image_data.to_blob
=end
  end
end
