require './config/environment'
require 'rack-flash'

class SessionController < Sinatra::Base

  configure do
      set :views, 'app/views'
      enable :sessions
      set :session_secret, "community-events"
      use Rack::Flash
  end

  get '/' do
    @events = Event.all
    erb :index  #general event feed
  end

end
