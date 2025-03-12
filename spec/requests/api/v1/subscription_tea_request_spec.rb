require 'rails_helper'

RSpec.describe 'subscription teas API' do
    before :each do
        @kendra = Customer.create!(first_name: "Kendra", last_name: "Singer", email: "showyourauss@gmail.com", address: "1000 Money Rd, Georgetown, TX, 12345")
    
        @green_tea = Tea.create!(name: "Green Tea", description: "A soothing green tea rich in antioxidants.", temp: 175.0, brew_time: 2.0)
        @raspberry_tea = Tea.create!(name: "Raspberry Tea", description: "A fruity tea with a hint of raspberry sweetness.", temp: 190.0, brew_time: 3.0)
        @lemon_honey_tea = Tea.create!(name: "Lemon Honey Tea", description: "A comforting blend of lemon and honey.", temp: 185.0, brew_time: 4.0)
    
        @deluxe = Subscription.create!(title: "Deluxe Monthly", price: 29.99, status: 'active')  
    
        SubscriptionTea.create!(subscription: @deluxe, tea: @green_tea)
        SubscriptionTea.create!(subscription: @deluxe, tea: @raspberry_tea)
        SubscriptionTea.create!(subscription: @deluxe, tea: @lemon_honey_tea)
    
        CustomerSubscription.create!(customer: @kendra, subscription: @deluxe)
    end
    
    it 'can list all teas within a subscription' do
        get "/api/v1/customers/#{@kendra.id}/subscriptions/#{@deluxe.id}/subscription_teas"
    
        expect(response).to be_successful
        json = JSON.parse(response.body, symbolize_names: true)
        expect(json[:data].count).to eq(3)  
    end

    it 'can return the details of a specfic tea in a subscription' do
        get "/api/v1/customers/#{@kendra.id}/subscriptions/#{@deluxe.id}/subscription_teas/#{@green_tea.id}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]
        
        expect(json[:attributes][:name]).to eq('Green Tea')
        expect(json[:attributes][:description]).to eq('A soothing green tea rich in antioxidants.')
        expect(json[:attributes][:temp]).to eq(175.0)
        expect(json[:attributes][:brew_time]).to eq(2.0)
    end
end