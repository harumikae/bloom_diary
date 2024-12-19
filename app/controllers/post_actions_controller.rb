class PostActionsController < ApplicationController
  before_action :set_post

  def create
    @post_action = @post.post_actions.build(post_action_params)
    if @post_action.save
      if @post.private_post?
        redirect_to private_posts_path, notice: "実行したことを追加しました！"
      else
        redirect_to shared_posts_path, notice: "実行したことを追加しました！"
      end
    end
  end
  
  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def post_action_params
    params.require(:post_action).permit(:content)
  end
end
