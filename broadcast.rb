begin
  require "android"
rescue LoadError
  require "mock_android"
end

require "erb"

class Broadcast < Sinatra::Base 

  DROID = Android.new

  set :views, File.join(APP_DIR, "views")
  set :public, File.join(APP_DIR, "public")

  get '/' do
    @temp = DROID.batteryGetTemperature
    get_location_coordinates
    erb :"index.html" 
  end

  get "/snapshot" do
    content_type 'image/png'
    img_path = File.join APP_DIR, "snapshots", "latest.png"
    DROID.cameraCapturePicture img_path
    File.read(img_path).to_blob
  end

  def get_location_coordinates
    result = DROID.getLastKnownLocation["result"]
    location_data = result["gps"] || result["passive"]
    @latitude, @longitude = location_data["latitude"], location_data["longitude"]
    !!@longitude
  end
end
