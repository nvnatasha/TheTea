class Customer < ApplicationRecord
    has_many :customer_subscriptions
    has_many :subscriptions, through: :customer_subscriptions
    has_many :teas, through: :subscriptions

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :address, presence: true
end