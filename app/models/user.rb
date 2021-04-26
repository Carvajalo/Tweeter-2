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
  has_many :tweets
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

        

end
