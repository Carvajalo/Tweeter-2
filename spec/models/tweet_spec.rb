require 'rails_helper'

RSpec.describe Tweet, type: :model do
  
  # Validations Test :
  # Validate Text
  describe "Validation" do
    it { should validate_presence_of(:text) }
  end

  # Validate Username
  describe "Validation" do
    it { should validate_presence_of(:username) }
  end

  # Validate User_id
  describe "Validation" do
    it { should validate_presence_of(:user_id) }
  end

  # Validate length
  describe "Validation" do
    it { should validate_length_of(:text).is_at_most(280) }
  end

  # Associations Test :
  # Belongs_to:user
  describe "Association" do
    it { should belong_to(:user) }
  end
end
