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
    set_location_coordinates
    set_temp
    set_status
    erb :"index.html" 
  end

  get "/snapshot.jpg" do
    content_type 'image/png'
    img_path = File.join APP_DIR, "snapshots", "latest.jpg"
    DROID.cameraCapturePicture img_path
    File.read(img_path)
  end

  def set_temp
    @temp = DROID.batteryGetTemperature["result"].to_f / 10
  end

  def set_status
    map =  {
      "1" => "unknown",
      "2" => "charging",
      "3" => "discharging",
      "4" => "not charging",
      "5" => "full"
    }
    
    result = DROID.batteryGetStatus["result"].to_s
    @status = map[result]
  end

  def set_location_coordinates
    result = DROID.getLastKnownLocation["result"]
    location_data = result["gps"] || result["passive"]
    @latitude, @longitude = location_data["latitude"], location_data["longitude"]
    !!@longitude
  end
end
