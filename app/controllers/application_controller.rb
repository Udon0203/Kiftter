class ApplicationController < ActionController::Base
  # 参考
  # progate Ruby on Rails5 https://prog-8.com/languages/rails5
  before_action :userset

  def userset
    @this_user = User.find_by(id: session[:userid])
  end

  def logincheck
    if @this_user == nil
      flash[:notice] = "ログインしてください。"
      redirect_to ("/login")
    end
  end

  def notlogincheck
    if @this_user
      flash[:notice] = "ログアウトしてください"
      redirect_to ("/top")
    end
  end
end
