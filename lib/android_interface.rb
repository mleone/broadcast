begin
  require "android"
rescue LoadError
  require "mock_android"
end

module AndroidInterface
  DROID = Android.new
  
  def battery_temperature
    DROID.batteryGetTemperature["result"].to_f / 10
  end

  def battery_status
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

  def location_coordinates
    result = DROID.getLastKnownLocation["result"]
    data = result["gps"] || result["passive"]
    latitude, longitude = data["latitude"], data["longitude"]
    longitude ? [latitude, longitude] : false
  end

  # stub
  def capture_picture_data(opts={})
    img_path = File.join SNAPSHOT_DIR, "latest.jpg"
    if !File.exist?(img_path) || opts[:refresh] 
      DROID.cameraCapturePicture img_path
    end
   File.read img_path
  end
end
