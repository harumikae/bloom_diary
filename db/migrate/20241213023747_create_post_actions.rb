class CreatePostActions < ActiveRecord::Migration[7.1]
  def change
    create_table :post_actions do |t|
      t.references :post, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
