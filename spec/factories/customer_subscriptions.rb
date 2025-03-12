FactoryBot.define do
    factory :customer_subscription do
        association :customer
        association :subscription
    end

    

end