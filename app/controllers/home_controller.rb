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
    
    if @user 
      flash[:notice] = "ログインしました"
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      redirect_to("/home")
    else
      flash[:notice] = "ログインに失敗しました"
      redirect_to("/home")
    end
  end
  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to("/home")
  end
end
