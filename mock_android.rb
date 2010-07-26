class Android
  def getLastKnownLocation
    {"error"=>nil, "id"=>4, "result"=>{"passive"=>{"provider"=>"gps", "time"=>1280112285800, "longitude"=>-77.3950646833333, "latitude"=>41.8636186666667, "speed"=>0, "accuracy"=>24, "altitude"=>38.7}, "gps"=>{"provider"=>"gps", "time"=>1280112285800, "longitude"=>-77.3950646833333, "latitude"=>41.8636186666667, "speed"=>0, "accuracy"=>24, "altitude"=>38.7}, "network"=>nil}}
  end

  def batteryGetTemperature
    return "38"
  end
end
