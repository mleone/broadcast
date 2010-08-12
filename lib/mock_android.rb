require "fileutils"

class Android
  @@id = 1

  # android api call id
  def get_id
    result = @@id
    @@id += 1
    result
  end

  # this stub produces random coordinates, within some bounds, for dynamic testing
  def getLastKnownLocation
    lat = 41.39506 + rand
    lon = -78.19506 + rand
    {"error"=>nil, "id"=> get_id, "result"=>{"passive"=>{"provider"=>"gps", "time"=>1280112285800, "longitude"=>lon, "latitude"=>lat, "speed"=>0, "accuracy"=>24, "altitude"=>38.7}, "gps"=>{"provider"=>"gps", "time"=>1280112285800, "longitude"=>lon, "latitude"=>lat, "speed"=>0, "accuracy"=>24, "altitude"=>38.7}, "network"=>nil}}
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
    sleep 1.0 # simulate camera delay :-)
    true
  end

end
