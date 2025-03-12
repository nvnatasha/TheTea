require 'rails_helper'

RSpec.describe 'customers API' do
    before :each do
        @kendra = Customer.create!(first_name: "Kendra", last_name: "Singer", email: "showyourauss@gmail.com", address: "1000 Money Rd, Georgetown, TX, 12345")
        @marissa = Customer.create!(first_name: "Marissa", last_name: "Koell", email: "mamabear@gmail.com", address: "2000 Cozy Rd, Tuscon, AZ, 23456")
        @bobby = Customer.create!(first_name: "Bobby", last_name: "Vasquez", email: "shootbv@gmail.com", address: "3000 Coder Rd, Raleigh, NC, 34567")
    end

    it 'can return all customers' do

        get "/api/v1/customers"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(json).to be_an(Array)
        expect(json.count).to eq(3)
        expect(json.first[:attributes]).to include(:first_name)
        expect(json.first[:attributes]).to include(:last_name)
        expect(json.first[:attributes]).to include(:email)
        expect(json.first[:attributes]).to include(:address)
    end
end