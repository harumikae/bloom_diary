class Post < ApplicationRecord
  belongs_to :diary

  validates :target, :treat, presence: true
  #バリデーションの追記　目標とご褒美は必須

  enum visibility: { private_post: 0, shared_post: 1 }
  # 公開・非公開の設定
end
