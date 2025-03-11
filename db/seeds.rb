# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Customer.destroy_all
Tea.destroy_all
Subscription.destroy_all
SubscriptionTea.destroy_all
CustomerSubscription.destroy_all


admin1 = User.create!(first_name: "Chrissy", last_name: "Karmann", username: "chrissy_admin")
admin2 = User.create!(first_name: "Marines", last_name: "Poke", username: "marines_admin")


green_tea = Tea.create!(name: "Green Tea", description: "A soothing green tea rich in antioxidants.", temp: 175.0, brew_time: 2.0)
raspberry_tea = Tea.create!(name: "Raspberry Tea", description: "A fruity tea with a hint of raspberry sweetness.", temp: 190.0, brew_time: 3.0)
lemon_honey_tea = Tea.create!(name: "Lemon Honey Tea", description: "A comforting blend of lemon and honey.", temp: 185.0, brew_time: 4.0)



basic = Subscription.create!(title: "Basic Monthly", price: 9.99, status: true)
premium = Subscription.create!(title: "Premium Monthly", price: 19.99, status: true)
deluxe = Subscription.create!(title: "Deluxe Monthly", price: 29.99, status: true)  


customer1 = Customer.create!(first_name: "Kendra", last_name: "Singer", email: "showyourauss@gmail.com", address: "1000 Money Rd, Georgetown, TX, 12345")
customer2 = Customer.create!(first_name: "Marissa", last_name: "Koell", email: "mamabear@gmail.com", address: "2000 Cozy Rd, Tuscon, AZ, 23456")
customer3 = Customer.create!(first_name: "Bobby", last_name: "Vasquez", email: "shootbv@gmail.com", address: "3000 Coder Rd, Raleigh, NC, 34567")


SubscriptionTea.create!(subscription: basic, tea: green_tea)
SubscriptionTea.create!(subscription: premium, tea: green_tea) 
SubscriptionTea.create!(subscription: premium, tea: raspberry_tea)
SubscriptionTea.create!(subscription: deluxe, tea: green_tea)
SubscriptionTea.create!(subscription: deluxe, tea: raspberry_tea)
SubscriptionTea.create!(subscription: deluxe, tea: lemon_honey_tea)


CustomerSubscription.create!(customer: customer1, subscription: basic)
CustomerSubscription.create!(customer: customer2, subscription: premium)
CustomerSubscription.create!(customer: customer3, subscription: deluxe)
CustomerSubscription.create!(customer: customer1, subscription: premium)