class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable

  def up_votes
    votes.where(:type => 'UpVote')
  end

  def down_votes
    votes.where(:type => 'DownVote')
  end

  # downvote? -does this comment have a downvote from this user?
  def downvote?
  # TODO
  end
  def upvote?
    #TODO
  end

end
