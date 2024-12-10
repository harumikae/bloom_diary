class RemoveSharedFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :shared, :boolean
  end
end
