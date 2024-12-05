class AddSharedToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :shared, :boolean
  end
end
