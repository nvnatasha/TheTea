require 'rails_helper'

RSpec.describe 'teas API' do
    before :each do
        @green_tea = Tea.create!(name: "Green Tea", description: "A soothing green tea rich in antioxidants.", temp: 175.0, brew_time: 2.0)
        @raspberry_tea = Tea.create!(name: "Raspberry Tea", description: "A fruity tea with a hint of raspberry sweetness.", temp: 190.0, brew_time: 3.0)
        @lemon_honey_tea = Tea.create!(name: "Lemon Honey Tea", description: "A comforting blend of lemon and honey.", temp: 185.0, brew_time: 4.0)
    end

    it 'can return all teas' do

        get "/api/v1/teas"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(json).to be_an(Array)
        expect(json.count).to eq(3)
    end

    it 'can return a single tea and its information' do

        get "/api/v1/teas/#{@raspberry_tea.id}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(json[:attributes][:name]).to be_a(String)
        expect(json[:attributes][:description]).to be_a(String)
        expect(json[:attributes][:temp]).to be_a(Float)
        expect(json[:attributes][:brew_time]).to be_a(Float)
        expect(json[:attributes][:name]).to eq('Raspberry Tea')
        expect(json[:attributes][:description]).to eq('A fruity tea with a hint of raspberry sweetness.')
        expect(json[:attributes][:temp]).to eq(190.0)
        expect(json[:attributes][:brew_time]).to eq(3.0)
    end
end