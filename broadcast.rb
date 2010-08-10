require "erb"
require "android_interface"

class Broadcast < Sinatra::Base 

  include AndroidInterface

  set :views, File.join(APP_DIR, "views")
  set :public, File.join(APP_DIR, "public")

  get '/' do
    @latitude, @longitude = location_coordinates
    @temp = battery_temperature
    @status = battery_status
    erb :"index.html" 
  end

  get "/snapshot.jpg" do
    content_type 'image/png'
    capture_picture_data
  end

end
