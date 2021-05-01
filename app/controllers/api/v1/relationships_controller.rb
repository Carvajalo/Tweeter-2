module Api 
    module V1
        class RelationshipsController < ApiController
            #GET /api/v1/followers -a email@uninorte.edu.co:Auth_token
            before_action :get_following, only: [:tweets_list, :following]
            before_action :get_followers, only: [:follower]


            def follower
                render json: @followers
            end

            #GET /api/v1/following -a email@uninorte.edu.co:Auth_token
            def following
                render json: @following
            end

            #GET/api/v1/relationships/:id
            def show
                render json: @relation
            end

            #http POST :3000/api/v1/relationship followed_id=:id -a email@uninorte.edu.co:Auth_token
            def create
                @relation = Relationship.new(relation_params)
                @relation.follower_id =  current_user.id
                if @relation.save
                    render json: @relation, status: :ok
                else 
                    head :no_content
                end
                

            end


            def tweets_list
                @tweets=[]
                @tweets = @tweets.concat(current_user.tweets)
                @following.each do |following|
                    @tweets = @tweets.concat(following.tweets)
                end
                render json: @tweets, status: 200
            end

            #DELETE  /api/v1/relationships/:id
            # def destroy
            #     render json: @relation, status: :ok
            #     #a.following_users.find_by_followed_id(4)
            #     #current_user.following_users.find_by_followed_id(relation_params).destroy
            #     head :no_content 
            # end
         


            private

            def get_following
                @following = current_user.following
                #@following = Relationship.find_by_follower_id(params[:id])
            end

            def get_followers
                @followers = current_user.followers
            end

            def relation_params
                params.require(:relationship).permit(:followed_id)
            end


            def follower_params
                params.require(:relationship).permit(:follower_id)
            end


        end
    end
end