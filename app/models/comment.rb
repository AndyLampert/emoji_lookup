class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :user
  belongs_to :post

  def add_comment(post, user)
    post = Post.find(params[:id])
    user = current_user

    # t.integer  "post_id"
    # t.text     "body"
    # t.integer  "user_id"
  end
end
