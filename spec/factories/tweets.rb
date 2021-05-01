FactoryBot.define do
    factory :tweet do
        sequence(:id) { |n| }
        username {  "Tweet username - Rspec test" }
        user_id { "Tweet user_id - Rspec test" }
        text { "Tweet Description - Rspec test" }
        created_at { Time.now }
        updated_at { Time.now }
    end

    
    # t.text "text"
    # t.string "username"
    # t.integer "user_id"
end
