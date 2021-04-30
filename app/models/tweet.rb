class Tweet < ApplicationRecord
    #Validations
    validates :text, presence: true
    validates :username, presence: true
    validates :user_id, presence: true
    validates :text, length: { maximum: 280 }


    #Relations
    belongs_to :user

    #Restrictions

    #before_actions
    
    #before_update

end
