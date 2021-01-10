class UsersController < ApplicationController
  before_action :logincheck, { only: [:index, :show, :followindex, :followerindex, :change] }
  before_action :notlogincheck, { only: [:login_go, :regist] }
  # 参考
  # progate Ruby on Rails5 https://prog-8.com/languages/rails5
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def followindex
    @user = User.find_by(id: params[:id])
  end

  def followerindex
    @user = User.find_by(id: params[:id])
  end

  def regist
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], icon_path: "default.jpg")

    if @user.save
      session[:userid] = @user.id
      flash[:notice] = "登録が完了しました。"
      redirect_to ("/timeline")
    else
      render("/regist")
    end
  end

  def login_go
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:userid] = @user.id
      flash[:notice]
      redirect_to ("/timeline")
    else
      @error = "メールアドレスかパスワードが間違っています。"
      @email = params[:email]
      @password = params[:password]
      render("users/login")
    end
  end

  def logout
    session[:userid] = nil
    flash[:notice] = "ログアウトしました。"
    redirect_to ("/login")
  end

  def edit
    if @this_user.id != params[:id].to_i
      redirect_to ("/timeline")
    else
      @user = User.find_by(id: params[:id])
    end
  end

  def change
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]

    if params[:icon]
      @user.icon_path = "#{@user.id}.jpg"
      icon = params[:icon]
      File.binwrite("public/icon/#{@user.icon_path}", icon.read)
    end

    if @user.save
      flash[:notice] = "ユーザー情報を変更しました。"
      redirect_to ("/users/#{@user.id}")
    else
      render("/users/#{@user.id}")
    end
  end
end
