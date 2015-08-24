class RemoveCommentsIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :comments_id
  end
end
