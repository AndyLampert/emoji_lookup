class Vote < ActiveRecord::Base
  # attr_accessor :vote_count

  belongs_to :votable, polymorphic: true

  # belongs_to :user
  # belongs_to :comment
end
