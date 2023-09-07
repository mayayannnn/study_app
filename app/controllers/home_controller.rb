class HomeController < ApplicationController
  def home
  end
  def create_user
    @user = User.new(name:params[:name],
                     email:params[:email])
    @user.save
    redirect_to("/home")
  end
  def signup
  end
end
