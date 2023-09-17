class HomeController < ApplicationController
  before_action :authenticate_user,{only: [:user,]}
  def home
  end
  def create_user
    @user = User.new(name:params[:name],
                     email:params[:email],
                     password:params[:password],
                     image_name: "default_user.jpg")
    @user.save
    session[:user_id] = @user.id
    session[:user_name] = @user.name
    redirect_to("/home")
  end
  def signup
  end
  def login
  end
  def login_user
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
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
  def user
    @user = User.find_by(id: params[:id])
    if @user.id != session[:user_id]
      redirect_to("/home")
    end
  end

  def user_edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    if params[:image]
      @user.image_name = "#{@user.id}.jpg"
      image = params[:image]
      File.binwrite("public/user_images/#{@user.image_name}",image.read)
    end
    @user.save
    redirect_to("/user/#{@user.id}")
  end
end
