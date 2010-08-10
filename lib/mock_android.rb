require "fileutils"

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

  # this stub takes a random test image and copies it to latest.jpg
  def cameraCapturePicture(path)
    images = %w(test1.jpg test2.jpg test3.jpg)
    image = images[rand images.size]
    dest = File.join SNAPSHOT_DIR, "latest.jpg"
    src = File.join IMAGE_DIR, image
    FileUtils.copy src, dest
    true
  end

end
