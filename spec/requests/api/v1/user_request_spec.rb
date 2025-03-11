require 'rails_helper'

RSpec.describe 'users API' do
    before :each do
        @user = create(:user, first_name: "Chrissy", last_name: "Karmann", username: "ckarmann")
    end

    it 'returns inforrmation of a user' do
        get "/api/v1/users/#{@user.id}"

        expect(response).to be_successful
        expect(response.status).to eq(200)

        json = JSON.parse(response.body, symbolize_names: true)[:data]

        expect(json[:id]).to be_a(String)
        expect(json[:id]).to eq(@user.id.to_s)
        expect(json[:type]).to eq('user')
        expect(json[:attributes][:first_name]).to be_a(String)
        expect(json[:attributes][:first_name]).to eq('Chrissy')
        expect(json[:attributes][:last_name]).to be_a(String)
        expect(json[:attributes][:last_name]).to eq('Karmann')
        expect(json[:attributes][:username]).to be_a(String)
        expect(json[:attributes][:username]).to eq('ckarmann')

    end
end