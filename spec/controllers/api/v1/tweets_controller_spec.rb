require 'rails_helper'

RSpec.describe Api::V1::TweetsController, '#show' do

    context "When tweet exist" do
        let(:user) {create(:user)}
        #let(:tweet) { FactoryGirl.create(:user) }
        let(:tweet) {create(:tweet, username: user.username, user_id: user.id)}
        before do
            get :show, params: {id: tweet.id}
        end

        it "Should returns HTTP success code" do
            expect(response).to have_http_status(:success)
        end

        it "Should return Tweet in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response.keys).to match_array(["id", "text", "username", "user_id", "created_at", "updated_at"])
            # expect(json_response)
            # JSON.parse(response.body).keys
            # JSON.parse(response.body).values
        end

    end
 
    context "When tweet does not exist" do
        before do
            get :show, params: {id: 999999}
        end

        it "Should returns HTTP 404 code" do
            json_response = JSON.parse(response.body)
            expect(json_response["status"]).to match(404)
        end

        #response.body
        #JSON.parse(response.body)
        #JSON.parse(response.body)["error"]
        it "Should return Tweet in JSON body" do
            json_response = JSON.parse(response.body)
            expect(json_response["error"]).to match("Tweet not found")
        end

    end



  
end


# RSpec.describe Api::V1::TweetsController, '#create' do
#     let(:user) {create(:user)}
#     context "When a task is saved with valid params and User is logged in" do
#         before do 
#         byebug
#         post :create, params: {tweet: { text: "Test in rspec",
#                                         user_id: user.id,
#                                         username: user.username
#                                     }
#                             }
#         byebug
#         end
        

#         # it "Should not be save on DB and render an error" do
#         #   expect(Tweet.last.text).to eq("Test in rspec")
#         # end

        
#         it "Returns HTTP success code" do
#             expect(response).to have_http_status(:success)
#         end

#     end

# end