class DiariesController < ApplicationController
  before_action :authenticate_user!
#以下のアクションを実行前にユーザーがログインしてるか確認してる
  def create
    @diary = current_user.build_diary(diary_params)
    if @diary.save
      redirect_to root_path, notice: "あなたの日記が作られました"
    else
      redirect_to root_path, alert: "日記を作ることができませんでした。日記タイトルを入力してください。"
    end
  end

  private
  
  def diary_params
    params.require(:diary).permit(:diarys_title)
  end
end
