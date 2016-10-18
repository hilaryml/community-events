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
    #if logged in, dont show login or signup links, show logout link instead... can I put this in the layout instead?
    @events = Event.all
    erb :index  #general event feed
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      current_user ||= User.find_by(email: session[:email]) if session[:email]
    end

    def login(username, password)
      @user = User.find_by(username: username)
      if @user && @user.authenticate(password)
        session[:email] = @user.email
        redirect "/index"
      else
        redirect "/login"
      end
    end

    def logout
      session.clear
    end

  end

end
