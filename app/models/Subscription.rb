class Subscription < ApplicationRecord
    has_many :subscription_teas
    has_many :teas through: :subscription_teas
    has_many :customer_subscriptions
    has_many :customers through: customer_subscriptions
end