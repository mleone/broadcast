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

  def test_get_snapshot
    get '/snapshot.jpg'
    assert last_response.ok?
    assert last_response.body.length > 10000
  end

  def test_get_update
    get '/update.jpg'
    assert last_response.ok?
    assert last_response.body.length > 10000
  end

  def test_get_location
    get '/location.json'
    assert last_response.ok?
  end

  def test_tts
    post '/say.json'
    assert last_response.ok?
  end
end
