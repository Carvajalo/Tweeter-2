class RelationshipsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user
    #Relationship.new(follower_id: a.id, followed_id: b.id).save
    def create
        current_user.follow(@user)
        redirect_back fallback_location: "/"
    end
    
    def destroy
        current_user.unfollow(@user)
        redirect_back fallback_location: "/"
    end

    #b.following.include?(a)
    #b.followers.include?(a)
    def show
        
    end

    def followers

    end

    private
    def find_user
        @user = User.find(params[:id])
    end


    
end