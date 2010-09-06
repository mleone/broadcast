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

  def location_coordinates(opts={})
    result = DROID.getLastKnownLocation["result"]
    refresh_location if (result.nil? || opts["refresh"])
    data = result["gps"] || result["network"] || result["passive"] || nil
    latitude, longitude = data["latitude"], data["longitude"] if data
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

  # returns false if unsuccessful
  def say(message)
    if DROID.ttsIsSpeaking["result"] 
      false
    else
      DROID.ttsSpeak message
      true
    end
  end

  def save_upload(filename, file_data)
    path = File.join UPLOADS_DIR, filename
    if File.exist? path
      {:success => false, :message => "File already exists."}
    else
      File.open(path, 'w') {|f| f.write(file_data) }
      {:success => true, :message => "File uploaded successfully"}
    end
  end

  private

  def refresh_location
    DROID.startLocating
    sleep 1
    DROID.readLocation
    DROID.stopLocating 
  end
end
