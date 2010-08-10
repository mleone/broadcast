class Android
  @@id = 1

  # android api call id
  def get_id
    result = @@id
    @@id += 1
    result
  end

  def getLastKnownLocation
    {"error"=>nil, "id"=> get_id, "result"=>{"passive"=>{"provider"=>"gps", "time"=>1280112285800, "longitude"=>-77.3950646833333, "latitude"=>41.8636186666667, "speed"=>0, "accuracy"=>24, "altitude"=>38.7}, "gps"=>{"provider"=>"gps", "time"=>1280112285800, "longitude"=>-77.3950646833333, "latitude"=>41.8636186666667, "speed"=>0, "accuracy"=>24, "altitude"=>38.7}, "network"=>nil}}
  end

  def batteryGetTemperature
    {"error" => nil, "id" => get_id, "result" => 330}
  end

  def batteryGetStatus
    {"error" => nil, "id" => get_id, "result" => 3}
  end

  def cameraCapturePicture(path)
    true
  end

end
