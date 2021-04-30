require 'rails_helper'



RSpec.describe Api::V1::TweetsController, '#destroy' do

    context "When tweet exist" do
        let(:user) { create(:user)}
        let(:tweet) { create(:tweet, user: user)}

        before do
            post :destroy, params: {id: tweet.id}
        end

        it "Should return status 200" do
            expect(response.status).to eq(200)
        end
    end

    context "When tweet does not exist" do
        
        before do
            post :destroy, params: { id: 1}
        end

        it "Should return status 404" do
            json_response = JSON.parse(response.body)
            expect(json_response["status"]).to match(404)
        end
    end
end

