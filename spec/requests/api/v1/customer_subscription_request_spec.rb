require 'rails_helper'

RSpec.describe 'customer subscriptions API' do
    before :each do
        @kendra = Customer.create!(first_name: "Kendra", last_name: "Singer", email: "showyourauss@gmail.com", address: "1000 Money Rd, Georgetown, TX, 12345")
        @marissa = Customer.create!(first_name: "Marissa", last_name: "Koell", email: "mamabear@gmail.com", address: "2000 Cozy Rd, Tuscon, AZ, 23456")
        @bobby = Customer.create!(first_name: "Bobby", last_name: "Vasquez", email: "shootbv@gmail.com", address: "3000 Coder Rd, Raleigh, NC, 34567")

        @green_tea = Tea.create!(name: "Green Tea", description: "A soothing green tea rich in antioxidants.", temp: 175.0, brew_time: 2.0)
        @raspberry_tea = Tea.create!(name: "Raspberry Tea", description: "A fruity tea with a hint of raspberry sweetness.", temp: 190.0, brew_time: 3.0)
        @lemon_honey_tea = Tea.create!(name: "Lemon Honey Tea", description: "A comforting blend of lemon and honey.", temp: 185.0, brew_time: 4.0)

        @basic = Subscription.create!(title: "Basic Monthly", price: 9.99, status: 'active')
        @premium = Subscription.create!(title: "Premium Monthly", price: 19.99, status: 'active')
        @deluxe = Subscription.create!(title: "Deluxe Monthly", price: 29.99, status: 'active')  

        SubscriptionTea.create!(subscription: @basic, tea: @green_tea)
        SubscriptionTea.create!(subscription: @premium, tea: @green_tea) 
        SubscriptionTea.create!(subscription: @premium, tea: @raspberry_tea)
        SubscriptionTea.create!(subscription: @deluxe, tea: @green_tea)
        SubscriptionTea.create!(subscription: @deluxe, tea: @raspberry_tea)
        SubscriptionTea.create!(subscription: @deluxe, tea: @lemon_honey_tea)


        CustomerSubscription.create!(customer: @kendra, subscription: @basic)
        CustomerSubscription.create!(customer: @marissa, subscription: @premium)
        CustomerSubscription.create!(customer: @bobby, subscription: @deluxe)
        CustomerSubscription.create!(customer: @kendra, subscription: @deluxe)
    end 

    it 'can show a customer subscription' do

        get "/api/v1/customers/#{@kendra.id}/subscriptions/#{@basic.id}"
    
        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(json[:attributes][:title]).to eq('Basic Monthly')
        expect(json[:attributes][:status]).to eq('active')
    end
    
    it 'can update a customer subscription status' do

        get "/api/v1/customers/#{@kendra.id}/subscriptions/#{@basic.id}"
    
        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(json[:attributes][:status]).to eq('active')

        patch "/api/v1/customers/#{@kendra.id}/subscriptions/#{@basic.id}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(json[:attributes][:status]).to eq('inactive')
        @basic.reload
        expect(@basic.status).to eq('inactive')
    end
    
    it 'can list all subscriptions for a customer' do
        get "/api/v1/customers/#{@kendra.id}/subscriptions"
    
        expect(response).to be_successful
        expect(response.status).to eq(200)
        # binding.pry
        json = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(json.count).to eq(2)
    end
end