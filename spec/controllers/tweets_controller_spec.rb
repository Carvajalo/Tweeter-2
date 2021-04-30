require 'rails_helper'

RSpec.describe TweetsController, "#create" do

    context "When a tweet is saved with invalid params" do
        it "Should not be save on DB and render an error" do
            expect { Tweet.create!}.to raise_error(ActiveRecord::RecordInvalid)
        end
    end

    context "When a tweet is saved with invalid params with user logged in" do
        let(:user) { create(:user) }
        before do
            sign_in(user)
            post :create, params: { tweet: 
                                    { 
                                      text: "tweet",
                                      username: user.username,
                                      user_id: user.id
                                    }
            }
        end

        it "Should not be save on DB" do
            expect(Tweet.last.text).to eq("tweet")
        end

        it "Should redirect user to Tweets Index" do
            expect(subject).to redirect_to(tweets_path)
        end
    end

    context "When a tweet is saved with valid params with user is NOT logged in" do
        let(:user) { create(:user) }
        before do
            post :create, params: { tweet: 
                                    { 
                                      text: "tweet",
                                      username: user.username,
                                      user_id: user.id
                                    }
            }
        end

        it "Should not be save on DB" do
            expect(Tweet.last).to eq nil
        end

        it "Should redirect user to Login" do
            expect(subject).to redirect_to(new_user_session_path)
        end

    end

end

RSpec.describe TweetsController, "#list" do

    context "When tweets are listed successfully" do        
        
        it "Should return HTTP found code" do
            get :index
            expect(response).to have_http_status(302)
        end
    end
end

