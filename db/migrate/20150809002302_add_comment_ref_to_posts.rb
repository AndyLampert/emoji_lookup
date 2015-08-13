class AddCommentRefToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :comments, index: true
  end
end
