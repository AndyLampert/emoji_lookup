class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :user
  belongs_to :post
  has_many :up_votes, through: :votes#, -> { where ... ? }
  has_many :down_votes, through: :votes
  has_many :votes, as: :votable

end
