class CreateDiaries < ActiveRecord::Migration[7.1]
  def change
    create_table :diaries do |t|
      t.string :diarys_title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
