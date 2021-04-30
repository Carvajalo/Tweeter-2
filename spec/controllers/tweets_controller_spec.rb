require 'rails_helper'

RSpec.describe TweetsController, "#create" do
  context "When a task is saved with invalid params" do
    it "Shoud not be save on DB" do
        expect {Tweet.create!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "When a task is saved with valid params and User is logged in" do
    let(:user) { create(:user)}
    before do 
    sign_in(user)
    post :create, params: {tweet: { text: "Test in rspec",
                                    user_id: user.id,
                                    username: user.username
                                  }
                          }
    end

    it "Should not be save on DB and render an error" do
      expect(Tweet.last.text).to eq("Test in rspec")
    end

    
    it "Should redirect User to Tweet index" do
      expect(subject).to redirect_to(tweets_path)
    end
  end

  
  context "When a tweet is saved with valid params and User is not logged in" do
    let(:user) { create(:user)}
    before do 
    #sign_in(user)
    post :create, params: {tweet: { text: "Test in rspec",
                                    user_id: user.id,
                                    username: user.username
                                  }
                          }
    end

    it "Should not be save on DB and render an error" do
      expect(Tweet.last).to eq nil
    end

    it "Should redirect User to login path" do
      expect(subject).to redirect_to(new_user_session_path)
    end
  end


  
end






