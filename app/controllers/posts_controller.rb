class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:shared_posts]#アクション実行前にユーザーがログインしてるか確認
  before_action :set_diary, only: [:new, :create]#特定ユーザーの日記を探し、@diary にセットする準備をしている
  before_action :set_post, only: [:update, :edit, :destroy]  # 特定の投稿をセット

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

  def edit
    @post = Post.find(params[:id])
    @diary = @post.diary  # ここで投稿から日記を取得
  end

  def update
    if @post.update(post_params)
       # 投稿の公開状態に応じてリダイレクト先を変更
      if @post.shared_post? # visibilityがshared_postの場合
      redirect_to shared_posts_path, notice: "投稿を更新しました"
    else
      redirect_to private_posts_path, notice: "投稿を更新しました"
    end
  else
    flash.now[:alert] = "更新に失敗しました"
    render :edit
  end
end

  def destroy
    @post = Post.find(params[:id])

    # ユーザーが投稿の所有者か確認
    if @post.diary.user == current_user
      @post.destroy
      # 削除後のリダイレクト先
      if @post.shared_post? # visibilityがshared_postの場合
        redirect_to shared_posts_path, notice: "投稿を更新しました"
      else
        redirect_to private_posts_path, notice: "投稿を更新しました"
      end
    else
      redirect_to root_path, alert: "この投稿を削除する権限がありません"
    end
  end

private

def set_diary
  @diary = current_user.diary || Diary.find_by(id: params[:diary_id])
  unless @diary
    redirect_to root_path, alert: "日記が見つかりませんでした"
  end
end

def set_post
  @post = Post.find(params[:id])
  @diary = @post.diary # 投稿から日記を取得する
end

  def post_params
    params.require(:post).permit(:target, :treat, :visibility)
  end
end
