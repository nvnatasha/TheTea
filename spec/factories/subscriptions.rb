FactoryBot.define do
    factory :subscription do
        title { "Basic Tea Subscription" }
        price { 10.99 }
        status { true } 

        trait :premium do
            title { "Premium Tea Subscription" }
            price { 19.99 }
            status { true }
        end

        trait :deluxe do
            title { "Deluxe Tea Subscription" }
            price { 29.99 }
            status { true }
        end

        trait :inactive do
            status { false }
        end
    end
end