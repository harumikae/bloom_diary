class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:shared_posts]#アクション実行前にユーザーがログインしてるか確認
  before_action :set_diary, only: [:new, :create, :edit_do, :update_do]#特定ユーザーの日記を探し、@diary にセットする準備をしている
  before_action :set_post, only: [:edit_do, :update_do]  # 特定の投稿をセット

  def new
    @post = @diary.posts.build
  end

  def create
    @post = @diary.posts.build(post_params)

    # どのボタンが押されたかで visibility を設定
    if params[:submit_type] == "share"
      @post.visibility = "shared_post"  # みんなに公開
      if @post.save
        redirect_to shared_posts_path, notice: "投稿がみんなに共有されました"
      else
        render :new, alert: "投稿作成に失敗しました"
      end
    else
      @post.visibility = "private_post" # 自分用
      if @post.save
        redirect_to private_posts_path, notice: "自分用の投稿が作成されました"
      else
        render :new, alert: "投稿作成に失敗しました"
      end
    end
  end

  def shared_posts
    @shared_posts = Post.shared_post
  end

  def private_posts
    @private_posts = current_user.diary.posts.private_post
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
    params.require(:post).permit(:target, :treat, :do, :visibility)
  end
end
