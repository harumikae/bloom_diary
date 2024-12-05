class PostsController < ApplicationController
  before_action :authenticate_user! #アクション実行前にユーザーがログインしてるか確認
  before_action :set_diary       #特定ユーザーの日記を探し、@diary にセットする準備をしている
  before_action :set_post, only: [:edit_do, :update_do]  # 特定の投稿をセット

  def new
    @post = @diary.posts.build
  end

  def create
    @post = @diary.posts.build(post_params)

    # どのボタンが押されたかを判別
    if params[:submit_type] == "share"
      @post.shared = true  # 共有設定
    else
      @post.shared = false # 自分用設定
    end

    if @post.save
      redirect_to root_path, notice: "投稿が作成されました"
    else
      redirect_to root_path, alert: "投稿作成に失敗しました"
  end
end

# 実行した内容を編集するフォームを表示
def edit_do
  # @post は before_action :set_post で取得済み
end

# 実行した内容を更新
def update_do
  if @post.update(post_params)
    redirect_to root_path, notice: "実行した内容が更新されました"
  else
    render :edit_do, alert: "更新に失敗しました"
  end
end

private

  def set_diary
    @diary = current_user.diary
  end

  def set_post
    @post = @diary.posts.find(params[:id]) # 投稿を取得
  end

  def post_params
    params.require(:post).permit(:target, :treat, :do, :shared)
  end
end
