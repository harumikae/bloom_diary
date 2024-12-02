class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # リレーションシップの定義
  # has_one :diary, dependent: :destroy

  #デバイスの機能
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  
  #バリデーション（データのルール）
  validates :name, presence: true #空はダメだよ・エラー発生やDBに保存されなくなるよ
end
