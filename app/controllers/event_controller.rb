class EventController < SessionController

  get "/events" do 
    if !logged_in?
      redirect "/login"
    else
      @user = current_user
      @events = @user.events
      erb :"/events/index"
    end
  end

  get "/events/new" do
    if !logged_in?
      redirect "/login"
    else
      erb :"events/new"
    end
  end

  post "/events" do
    @event = Event.new(title: params[:title], date: params[:date], time: params[:time], location: params[:location], description: params[:description], contact: params[:contact])
    @event.user = current_user
    if @event.save
      redirect "/events/#{@event.id}"
    else
      redirect "/events/new"
    end
  end

  get "/events/:id" do
    if !logged_in?
      redirect "/login"
    else
      @event = Event.find(params[:id])
      erb :"events/show"
    end
  end

end
