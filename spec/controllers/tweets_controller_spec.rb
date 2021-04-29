require 'rails_helper'

RSpec.describe TweetsController, "#create" do
  context "When a task is saved with invalid params" do
    it "Shoud not be save on DB" do
        expect {Tweet.create!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context "When a task is saved with valid params" do
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



  end
end






