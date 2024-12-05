class Post < ApplicationRecord
  belongs_to :diary

  validates :target, :treat, presence: true
  #バリデーションの追記　目標とご褒美は必須・do実行したことはオプション
end
