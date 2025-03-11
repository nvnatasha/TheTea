FactoryBot.define do
    factory :subscription_tea do
        association :subscription
        association :tea
    end
end