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
    @event = Event.new(title: params[:title], date: params[:date], location: params[:location], description: params[:description], contact: params[:contact])
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

  get "/events/:id/edit" do
    if !logged_in?
      redirect "/login"
    else
      @event = Event.find(params[:id])
      if @event.user = current_user
        @user = current_user
        erb :"events/edit"
      else
        flash[:message] = "Users can only edit their own events."
        redirect "/events"
      end
    end
  end

  patch "/events/:id" do
    @event = Event.find(params[:id])
    @event.update(title: params[:title], date: params[:date], location: params[:location], description: params[:description], contact: params[:contact])
    if @event.save
      redirect "/events/#{@event.id}"
    else
      redirect "/events/#{@event.id}/edit"
    end
  end

  delete "/events/:id" do
    if !logged_in?
      redirect "/login"
    else
      @event = Event.find(params[:id])
      if @event.user != current_user
        flash[:message] = "Users can only delete their own events."
        redirect "/events"
      else
        @event.delete
        flash[:message] = "Successfully deleted event."
        redirect "/events"
      end
    end
  end

end
