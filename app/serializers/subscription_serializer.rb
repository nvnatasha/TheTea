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
                        teas: subscription_teas.map do |tea|
                            {
                                id: tea.id.to_s,
                                name: tea.name,
                                description: tea.description,
                                temp: tea.temp,
                                brew_time: tea.brew_time
                            }
                        end
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
                    teas: subscription_teas.map do |tea|
                        {
                            id: tea.id.to_s,
                            name: tea.name,
                            description: tea.description,
                            temp: tea.temp,
                            brew_time: tea.brew_time
                        }
                    end
                }
            }
        }
    end
end