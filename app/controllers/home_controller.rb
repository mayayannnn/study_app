class HomeController < ApplicationController
  def home
  end
  def create_user
    @user = User.new(name:params[:name],
                     email:params[:email],
                     password:params[:password])
    @user.save
    redirect_to("/home")
  end
  def signup
  end
  def login
  end
  def login_user
    @user = User.find_by(email: params[:email],password: params[:password])
    redirect_to("/home")
  end
end
