class Post < ActiveRecord::Base

  validates :entry, length: { minimum: 8 }
  belongs_to :user
  has_many :comments
end
