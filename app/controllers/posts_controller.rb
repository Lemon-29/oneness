class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :create]
  before_action :set_post, only: [:edit, :update, :show]

  def index
    @posts = Post.includes(:comments).all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
    @comments = @post.comments
    @comment = @post.comments.build
    # @post = Post.find(params[:id])
    # @comments = @post.comments  #投稿詳細に関連付けてあるコメントを全取得
    # @comment = current_user.comments.new  #投稿詳細画面でコメントの投稿を行うので、formのパラメータ用にCommentオブジェクトを取得
  end

  def new
    @post = Post.new
  end

  def create
    # @post = Post.new(post_params)
    # @post.user_id = current_user.id
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: '編集しました！'
    else
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
    params.require(:post).permit(:content, :image, :image_cache, :user_id, :content)
  end
end
