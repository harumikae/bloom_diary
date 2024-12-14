class RemoveDoFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :do, :string
  end
end
