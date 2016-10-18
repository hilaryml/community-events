class UserController < SessionController

  def "/signup" do
    erb :"/users/signup"
  end

  def "/login" do
    erb :"users/login"
  end

end
