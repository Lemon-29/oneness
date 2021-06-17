class YogaRecordsController < ApplicationController
  before_action :which_yoga_deary?, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @yoga_records = YogaRecord.all
  end

  def new
    @yoga_record = YogaRecord.all
  end

  def create
    @yoga_record = YogaRecord.new(permitted_parameter)
    @yoga_record.usesr = current_user
    if @yoga_record = diary.save
      redirect_to yoga_records_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  private
   def permitted_parameter
    params.require(:horse_diary).permit(:content, :user_id)
   end
end
