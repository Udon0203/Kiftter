class RelationshipsController < ApplicationController
  # 引用コード
  # UMAwweb1 Rails フォローフォロワー機能を作る　https://umaweb1.hatenablog.com/entry/2019/10/26/120623
  def create
    user = User.find(params[:follow_id])
    following = @this_user.follow(user)
    if following.save
      flash[:success] = "ユーザーをフォローしました"
      redirect_to ("/users/#{params[:follow_id]}")
    else
      flash.now[:alert] = "ユーザーのフォローに失敗しました"
      redirect_to ("/users/#{params[:follow_id]}")
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = @this_user.unfollow(user)
    if following.destroy
      flash[:success] = "ユーザーのフォローを解除しました"
      redirect_to ("/users/#{params[:follow_id]}")
    else
      flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
      redirect_to ("/users/#{params[:follow_id]}")
    end
  end
end
