class UserController < SessionController

  get "/signup" do
    if !logged_in?
      erb :"/users/signup"
    else
      redirect "/"
    end
  end

  post "/signup" do
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    if @user.save
      login(params[:username], params[:password])
    else
      redirect "/signup"
    end
  end

  get "/login" do
    if !logged_in?
      erb :"users/login"
    else
      redirect "/"
    end
  end

  post "/login" do
    @user = User.find_by(email: params[:email])
    login(params[:username], params[:password])
    redirect "/"
  end

  get "/logout" do
    logout
    redirect "/login"
  end

end
