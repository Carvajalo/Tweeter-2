FactoryBot.define do
    factory :tweet do
        text {"Text_test"}
        sequence(:id) { |n| }

        created_at { Time.now }
        updated_at { Time.now }
    end

    
    # t.text "text"
    # t.string "username"
    # t.integer "user_id"
end
