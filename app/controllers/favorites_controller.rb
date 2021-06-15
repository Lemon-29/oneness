class FavoritesController < ApplicationController
  before_action :authenticate_user! 
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

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end
end
