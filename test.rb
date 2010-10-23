require File.join(File.dirname(__FILE__), 'environment')
require 'test/unit'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Broadcast
  end

  def test_it_shows_index_page
    get '/'
    assert last_response.ok?
  end

  def test_update_snapshot
    post '/update_snapshot'
    assert last_response.ok?
  end

  def test_get_location
    get '/location.json'
    assert last_response.ok?
  end

  def test_download
    get '/download?file=/snapshots/latest.jpg'
    assert last_response.ok?
  end

  def test_upload
    file = "automated_test_file.txt"
    put "/upload?qqfile=#{file}"
    assert last_response.ok?
  end

  def test_tts
    post '/say.json'
    assert last_response.ok?
  end
end
