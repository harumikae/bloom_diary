Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root to: "tops#index"
  # Defines the root path route ("/")
  # root "posts#index"]
  resources :diaries, only: [:create] do #日記に関連するルールの定義
    resources :posts, only: [:new, :create] do #投稿を新しく作成、既存の日記に紐付けするためのルール設定
      member do
        get :edit_do  # 実行した内容を編集するフォーム
        patch :update_do # 実行した内容を更新
      end
    end
  end
end
