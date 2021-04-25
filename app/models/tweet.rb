class Tweet < ApplicationRecord
    #Validations
    validates :text, presence: true
    validates :text, length: { maximum: 280 }


    #Relations

    #Restrictions

    #before_actions
    
    #before_update

end
