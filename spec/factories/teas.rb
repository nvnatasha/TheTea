FactoryBot.define do
    factory :tea do
        name { "Generic Tea" }
        description { "A soothing cup of tea." }
        temp { 80.0 }
        brew_time { 3.0 }

        trait :green_tea do
            name { "Green Tea" }
            description { "A refreshing and healthy green tea." }
            temp { 75.0 }
            brew_time { 2.5 }
        end

        trait :raspberry_tea do
            name { "Raspberry Tea" }
            description { "A fruity and tart raspberry-infused tea." }
            temp { 85.0 }
            brew_time { 4.0 }
        end

        trait :lemon_honey_tea do
            name { "Lemon Honey Tea" }
            description { "A soothing blend of lemon and honey." }
            temp { 90.0 }
            brew_time { 5.0 }
        end
    end
end