class UserController < SessionController

  get "/signup" do
    erb :"/users/signup"
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
    erb :"users/login"
  end

  post "/login" do
    
  end

end
