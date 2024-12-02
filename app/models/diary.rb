class Diary < ApplicationRecord
  belongs_to :user

  # validates :diarys_title, presence: true
end
