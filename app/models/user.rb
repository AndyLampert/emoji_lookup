class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :email, presence: true
  validates :username,
    :presence => true,
    :uniqueness => {
      :case_sensitive => false
    }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  # TODO need a dependent destroy somewhere?
  has_many :votes, through: :comments
end
