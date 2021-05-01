


FactoryBot.define do
    factory :user do
        sequence(:id) {|n|}
        sequence(:username )  {|n|"TestUsername#{n}"}
        sequence(:name) {|n|"TestName#{n}"}
        sequence(:email) { |n|"Testemail_#{n}@gmail.com"}
        sequence(:password) { |n| "Testemail#{n}"}
        created_at { Time.now }
        updated_at { Time.now }
        confirmed_at { Time.now }

    end

end
