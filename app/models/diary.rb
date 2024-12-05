class Diary < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy

  validates :diarys_title, presence: true
end
