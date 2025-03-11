FactoryBot.define do
    factory :customer do
        first_name { "Generic" }
        last_name  { "Customer" }
        email      { "generic@example.com" }
        address    { "123 Default St, City, ST, 00000" }

        trait :kendra do
            first_name { "Kendra" }
            last_name  { "Singer" }
            email      { "showyourauss@gmail.com" }
            address    { "1000 Money Rd, Georgetown, TX, 12345" }
        end

        trait :marissa do
            first_name { "Marissa" }
            last_name  { "Koell" }
            email      { "mamabear@gmail.com" }
            address    { "2000 Cozy Rd, Tucson, AZ, 23456" }
        end

        trait :bobby do
            first_name { "Bobby" }
            last_name  { "Vasquez" }
            email      { "shootbv@gmail.com" }
            address    { "3000 Coder Rd, Raleigh, NC, 34567" }
        end
    end
end