require './config/environment'
require 'rack-flash'

class SessionController < Sinatra::Base

  configure do
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "community-events"
      use Rack::Flash
  end
  
end
