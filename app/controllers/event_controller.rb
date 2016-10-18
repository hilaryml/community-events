class EventController < SessionController

  get "/events/new" do
    erb :"events/new"
  end

  post "/new" do
    @event = Event.new(title: params[:title], date: params[:date], time: params[:time], location: params[:location], description: params[:description], contact: params[:contact])
    if @event.save
      @event.user = current_user
      redirect "/events/#{@event.id}"
    else
      redirect "/events/new"
    end
  end

  get "/events/:id" do
    @event = Event.find(params[:id])
    erb :"events/show"
  end

end
