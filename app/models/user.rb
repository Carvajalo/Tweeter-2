class User < ApplicationRecord
  #validations
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
