require "erb"
require "json/pure"
require "android_interface"
require "file_tree_interface" 

class Broadcast < Sinatra::Base 
  include AndroidInterface
  include FileTreeInterface

  set :views, VIEW_DIR
  set :public, PUBLIC_DIR

  get '/' do
    @latitude, @longitude = location_coordinates
    @temp = battery_temperature
    @status = battery_status
    erb :"index.html"
  end

  # This takes a POST request for jquery-file-tree compatability, 
  # I don't necessarily agree with it 
  post '/browse' do
    render_file_tree params[:dir] 
  end

  get "/snapshot.jpg" do
    content_type 'image/png'
    capture_picture_data
  end

  get "/update.jpg" do
    content_type 'image/png'
    capture_picture_data :refresh => true
  end

  get '/location.json' do
    content_type 'json'
    location_coordinates(:refresh => true).to_json
  end

  post '/say.json' do
    content_type 'json'
    say(params[:message]).to_json
  end 

end
