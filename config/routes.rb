Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: "tops#index"
  # Defines the root path route ("/")
  # root "posts#index"]
  resources :diaries, only: [:create] do #日記に関連するルールの定義
    resources :posts, only: [:new, :create, :edit, :destroy, :update] do #投稿を新しく作成、既存の日記に紐付けするためのルール設定
      resources :post_actions, only: [:create]
    end
  end

  # 投稿一覧を「みんなの投稿」と「自分の投稿」に分けるルートを追加
  get "shared_posts", to: "posts#shared_posts", as: "shared_posts" # みんなの投稿
  get "private_posts", to: "posts#private_posts", as: "private_posts" # 自分の投稿

  get 'posts/bloom', to: 'posts#bloom', as: 'posts_bloom' # 花が咲く機能
end
