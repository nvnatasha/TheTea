class Subscription < ApplicationRecord
    has_many :subscription_teas
    has_many :teas, through: :subscription_teas
    has_many :customer_subscriptions
    has_many :customers, through: :customer_subscriptions

    validates :title, presence: true
    validates :price, presence: true
    # validates :status, inclusion: { in: [true, false] }


    # scope :active, -> { where(status: 'active') }
    # scope :inactive, -> { where(status: 'inactive') }

    # def toggle_status
    #     update!(status: !status)
    # end

    # def self.active
    #     where(status: true)
    # end
    
    # def self.inactive
    #     where(status: false)
    # end

    def activate!
        update(status: true)
    end

    def deactivate!
        update(status: false)
    end


end