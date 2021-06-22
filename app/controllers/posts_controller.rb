class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :check_sender, only: [:edit, :update, :destroy]

  def index
    @posts = Post.includes(:comments).all.order(created_at: :desc)
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comment = @post.comments.build
    @comments = @post.comments.select(&:id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now['alert'] = @post.error_message_list("次の理由で投稿できませんでした")
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: '編集しました！'
    else
      flash.now['alert'] = @post.error_message_list("次の理由で投稿できませんでした")
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '削除しました！'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :content).merge(user_id: current_user.id)
  end

  def check_sender
    redirect_to posts_path, alert: 'アクセス権限がありません' if @post.user_id != current_user.id
  end
end
