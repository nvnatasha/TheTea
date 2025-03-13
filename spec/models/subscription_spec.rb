require 'rails_helper'

RSpec.describe Subscription, type: :model do

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:status) }

    it { should have_many(:subscription_teas) }
    it { should have_many(:teas).through(:subscription_teas) }
    it { should have_many(:customer_subscriptions) }
    it { should have_many(:customers).through(:customer_subscriptions) }

    it 'changes status from active to inactive' do
        subscription = create(:subscription, status: 'active')
    
        subscription.toggle_status!
    
        expect(subscription.status).to eq('inactive')
    end

    it 'changes status from inactive to active' do
        subscription = create(:subscription, status: 'inactive')
    
        subscription.toggle_status!
    
        expect(subscription.status).to eq('active')
    end
end