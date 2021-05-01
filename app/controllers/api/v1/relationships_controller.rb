module Api 
    module V1
        class RelationshipsController < ApiController
            #GET /api/v1/followers -a email@uninorte.edu.co:Auth_token
            def follower
                get_followers
                render json: @followers
            end

            #GET /api/v1/following -a email@uninorte.edu.co:Auth_token
            def following
                get_following
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
                    message_error = " "
                    @relation.errors.full_messages.each do |error|
                        message_error = message_error + " " + error
                    end
                    render error: {error: "message_error", status: 400}
                end


            end


            #DELETE  /api/v1/relationships/:id
            # def destroy
            #     get_following
            #     @following.find_by_id(:followed_id).destroy
            #     head :no_content 
            # end
         
            private
            # def Set_followers
            #     @followers = Relationship.find_by_follower_id(params[follower_id: user.id])
            # end

            def get_relations
                @relation = Relationship.find(params[:id])
                #@relation = Relationship.find(params[:id])
            end

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