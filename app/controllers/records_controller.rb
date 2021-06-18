class RecordsController < ApplicationController
  before_action :which_deary?, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(permitted_parameter)
    if @record.save
      redirect_to records_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  private
   def permitted_parameter
    params.require(:record).permit(:content).merge(user_id: current_user.id)
   end
end
