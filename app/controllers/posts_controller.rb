class PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts  = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end
  
  private
  def set_post
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(permitted_parameter)
      redirect_to posts_path, notice: '編集しました！'
    else
      render :edit
    end
  end

  def post_params
    params.require(:post).permit(:content, :image, :image_cache, :user_id)
  end
end
