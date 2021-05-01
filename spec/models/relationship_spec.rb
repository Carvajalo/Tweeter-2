require 'rails_helper'

RSpec.describe Relationship, type: :model do

  # Validations Test:
  # Validate follower_id
  describe "Validation" do
    it { should validate_presence_of(:follower_id) }
  end

  # Validate followed_id
  describe "Validation" do
    it { should validate_presence_of(:followed_id) }
  end
end