class TimelineController < ApplicationController
  before_action :logincheck, { only: [:index, :privateindex, :show, :new] }
  # 参考
  # progate Ruby on Rails5 https://prog-8.com/languages/rails5
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def privateindex
    @followusers = @this_user.followings
    @posts = Post.where(user_id: @followusers).or(Post.where(user_id: @this_user)).order(created_at: :desc)
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.showuserinfo
  end

  def new
  end

  def create
    @post = Post.new(comment: params[:text], user_id: @this_user.id)
    @post.save
    if params[:kifu]
      @post.kif_path = "#{@post.id}.kif"
      kifu = params[:kifu]
      File.binwrite("public/kifu/#{@post.kif_path}", kifu.read)
      @post.save
    else
      @post.kif_path = nil
    end

    redirect_to ("/timeline")
  end
end
