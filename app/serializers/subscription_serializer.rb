class SubscriptionSerializer
    
    def self.format_subscriptions(subscriptions)
        {
            data: subscriptions.map do |subscription|
                {
                    id: subscription.id.to_s,
                    type: 'subscription',
                    attributes: {
                        title: subscription.title,
                        price: subscription.price,
                        status: subscription.status
                    }
                }
            end
        }
    end

    def self.format_subscription(subscription)
        {
            data:{
                id: subscription.id.to_s,
                type: 'subscription',
                attributes: {
                    title: subscription.title,
                    price: subscription.price,
                    status: subscription.status
                }
            }
        }
    end
end