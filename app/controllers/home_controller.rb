class HomeController < ApplicationController
  before_action :authenticate_user,{only: [:user]}
  def home
  end
  def create_user
    if session[:user_id]
      redirect_to("/home")
    end
    if params[:password] == params[:password_check]
      @user = User.new(name:params[:name],
      email:params[:email],
      password:params[:password],
      image_name: "default_user.jpg")
      @user.save
      if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      redirect_to home_url, info: "登録しました"
      else
        flash[:notice] = "既に同じ名前や、emailの登録があります。変更してください。"
        redirect_to("/signup?name=#{params[:name]}&email=#{params[:email]}")
      end
    else
      flash[:notice] = "確認用パスワードが間違っています"
      redirect_to("/signup?name=#{params[:name]}&email=#{params[:email]}")
    end
  end
  def signup
    if session[:user_id]
      redirect_to("/home")
    end
    @name = params[:name]
    @email = params[:email]
  end
  def login
    if session[:user_id]
      redirect_to("/home")
    end
  end
  def login_user
    if session[:user_id]
    redirect_to("/home")
    end
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      redirect_to home_url, info: "ログインしました"
    else
      redirect_to home_url, danger: "ログインに失敗しました"
    end
  end
  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    redirect_to home_url, danger: "ログアウトしました"
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
    session[:user_name] = @user.name
    @user.save
    redirect_to("/user/#{@user.id}", success: "変更しました")

  end
end
