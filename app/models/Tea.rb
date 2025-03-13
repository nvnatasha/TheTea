class Tea < ApplicationRecord
    has_many :subscription_teas
    has_many :teas, through: :subscription_teas
    has_many :customers, through: :subscriptions

    validates :name, presence: true
    validates :description, presence: true
    validates :temp, presence: true
    validates :brew_time, presence: true
end