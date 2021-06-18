class FavoritesController < ApplicationController
  before_action :set_user, only: [:index]
  before_action :authenticate_user!

  def index
    @favorites = current_user.favorites.all.order(created_at: :desc).page(params[:page]).per(3)
    @posts = @favorites.map(&:post)
  end

  def create
    favorite = current_user.favorites.create(post_id: params[:post_id])
    redirect_to post_path(params[:post_id]),notice: 'お気に入りに追加しました！'
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id])
    favorite.destroy
    # @favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
    redirect_to posts_path,notice: 'お気に入りを解除しました！'
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
