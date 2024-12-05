class ChangeDoToNullableInPosts < ActiveRecord::Migration[7.1]
  def change
    change_column_null :posts, :do, true
  end
end
