class Comment < ActiveRecord::Base

  include EmojiHelper

  validates :body, presence: true

  belongs_to :user
  belongs_to :post
  has_many :votes, as: :votable

  def up_vote_count
    votes.where(:type => 'UpVote').count
  end

  def down_vote_count
    votes.where(:type => 'DownVote').count
  end

  def down_vote
    votes.where(:type => 'DownVote')
  end

  def up_vote
    votes.where(:type => 'UpVote')
  end

  # def set_down_vote
    # votes.(type => 'DownVote')
  # end

  def already_voted?
    votes.where(:user_id => user.id).exists?
  end

end
