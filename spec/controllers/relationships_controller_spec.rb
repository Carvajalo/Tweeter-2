require 'rails_helper'

RSpec.describe RelationshipsController, "#Following" do

    context "When show following is successful" do

        let(:user) { create(:user)}

        before do
            sign_in(user)
            post :show, params: {id: 1}
        end
        
        it "Should returns HTTP success code" do
            expect(response).to have_http_status(:success)
        end
    end

    context "When show following with user is NOT logged in" do

        let(:user) { create(:user)}

        before do
            post :show, params: {id: 1}
        end
        
        it "Should redirect user to Login" do
            expect(subject).to redirect_to(new_user_session_path)
          end
    end
end

RSpec.describe RelationshipsController, "#Followers" do

    context "When show followers is successful" do

        let(:user) { create(:user)}

        before do
            sign_in(user)
            post :followers, params: {id: 1}
        end
        
        it "Should returns HTTP success code" do
            expect(response).to have_http_status(:success)
        end
    end

    context "When show followers with user is NOT logged in" do

        let(:user) { create(:user)}

        before do
            post :followers, params: {id: 1}
        end

        it "Should redirect user to Login" do
            expect(subject).to redirect_to(new_user_session_path)
        end
    end
end

RSpec.describe RelationshipsController, "#Seguir" do

    context "When show followers is successful" do
        let(:user) { create(:user)}
        let(:user1) { create(:user)}
        let(:relationship) { create(:relationship, user: user)}

        before do
            sign_in(user)
        end
        
        it "Should redirect user to Login" do
            expect(response).to have_http_status(:success)
        end
    end

end