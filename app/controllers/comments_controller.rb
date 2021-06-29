class CommentsController < ApplicationController
  before_action :which_post?, only: [:create, :edit, :update, :destroy]
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :check_sender, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(permitted_parameter)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to post_path(@post), notice: @comment.error_message_list("次の理由で投稿できませんでした") }
      end
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメント編集中'
      format.js{ render :edit }
    end
  end

  def update
    @comment = @post.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(permitted_parameter)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index}
      else
        flash.now[:alert] = @comment.error_message_list("次の理由で更新できませんでした")
        format.js {render :edit_error}
      end
    end
  end

  def destroy
    @comment.destroy
    flash.now[:alert] = "コメントが削除されました"
    respond_to do |format|
      format.js { render :index }
    end
  end
  private
  def which_post?
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def permitted_parameter
    params.require(:comment).permit(:post_id, :content, :score).merge(user_id: current_user.id)
  end

  def check_sender
    redirect_to post_path(id: @post.id), alert: 'アクセス権限がありません' if @comment.user_id != current_user.id
  end
end
