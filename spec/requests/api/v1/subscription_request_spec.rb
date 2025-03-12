require 'rails_helper'

RSpec.describe 'subscriptions API' do
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

    it 'can return all subscriptions' do

        get "/api/v1/subscriptions"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(json).to be_an(Array)
        expect(json.count).to eq(3)
    end

    it 'can return a single subscrption and its information' do

        get "/api/v1/subscriptions/#{@deluxe.id}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(json[:id]).to eq(@deluxe.id.to_s)
        expect(json[:type]).to eq('subscription')
        expect(json[:attributes][:title]).to be_a(String)
        expect(json[:attributes][:price]).to be_a(Float)
        expect(json[:attributes][:status]).to be_a(String)
        expect(json[:attributes][:title]).to eq('Deluxe Monthly')
        expect(json[:attributes][:price]).to eq(29.99)
        expect(json[:attributes][:status]).to eq('active')
        expect(json[:attributes][:teas].first[:name]).to eq('Green Tea')
        expect(json[:attributes][:teas].first[:description]).to eq('A soothing green tea rich in antioxidants.')
        expect(json[:attributes][:teas].first[:temp]).to eq(175.0)
        expect(json[:attributes][:teas].first[:brew_time]).to eq(2.0)
    end

    it 'can update the status of a subscription' do
        
        get "/api/v1/customers/#{@bobby.id}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(json[:attributes][:subscriptions].first[:status]).to eq('active')

        patch "/api/v1/customers/#{@bobby.id}/subscriptions/#{@deluxe.id}"

        json = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(json[:attributes][:status]).to eq('inactive')
        @deluxe.reload
        expect(@deluxe.status_label).to eq('inactive')
    end
end