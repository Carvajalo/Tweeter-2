require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "Validations" do
    it { should validate_presence_of(:text) }
  end
end

RSpec.describe Tweet, type: :model do
  pending "Pending example"
end

RSpec.describe Tweet, type: :model do
  it { should belong_to(:user).class_name('User') }
end



