class EventController < SessionController

  get "/events/new" do
    erb :"events/new"
  end

end
