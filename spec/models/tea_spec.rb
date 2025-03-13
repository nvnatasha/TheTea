require 'rails_helper'

RSpec.describe Tea, type: :model do

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:temp) }
    it { should validate_presence_of(:brew_time) }

    it { should have_many(:subscription_teas) }
    it { should have_many(:teas).through(:subscription_teas) }
    it { should have_many(:customers).through(:subscriptions) }
end