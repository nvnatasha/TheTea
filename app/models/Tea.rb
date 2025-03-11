class Tea < ApplicationRecord
    has_many :subscription_teas
    has_many :teas, through: :subscription_teas
    has_many :customers, through: :subscriptions
end