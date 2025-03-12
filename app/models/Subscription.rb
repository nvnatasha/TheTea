class Subscription < ApplicationRecord
    has_many :subscription_teas
    has_many :teas, through: :subscription_teas
    has_many :customer_subscriptions
    has_many :customers, through: :customer_subscriptions

    def toggle_status!
        update(status: !status)
    end
    
    def status_label
        status ? "active" : "inactive"
    end

end