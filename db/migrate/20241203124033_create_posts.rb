class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :target, null: false
      t.string :treat, null: false
      t.string :do, null: false
      t.references :diary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
