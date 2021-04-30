class User < ApplicationRecord

  acts_as_token_authenticatable

  #Funtions: 
  def self.authenticate(email, user_token)
    # option: where("email = #{email} AND authentication_token = #{user_token}")
    where("email = ? AND authentication_token = ?", email, user_token)
  end

  
  #validations
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  #relations
  has_many :following_users, class_name:"Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :user_followers, class_name:"Relationship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :following_users, source: :followed
  has_many :followers, through: :user_followers, source: :follower


  def follow(user)
    following_users.create(followed_id: user.id)
  end

  def unfollow(user)
    following_users.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

  has_many :tweets
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

        

end
