require "erb"
require "json/pure"
require "android_interface"

class Broadcast < Sinatra::Base 
  include AndroidInterface

  set :views, VIEW_DIR
  set :public, PUBLIC_DIR

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

  get '/location.json' do
    content_type 'json'
    location_coordinates.to_json
  end
end
