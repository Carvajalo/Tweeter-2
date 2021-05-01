FactoryBot.define do
  factory :relationship do
    sequence(:id) { |n| }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
