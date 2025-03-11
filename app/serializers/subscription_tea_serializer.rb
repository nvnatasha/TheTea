class SubscriptionTeaSerializer

    def self.format_subscription_teas(subscription_teas)
        {
            data: subscription_teas.map do |subscription_tea|
                {
                    id: subscription_tea.id.to_s,
                    type: 'subscription_tea',
                    attributes: {
                        tea:
                            {
                            id: subscription_tea.tea.id,
                            name: subscription_tea.tea.name,
                            description: subscription_tea.tea.description,
                            temp: subscription_tea.tea.temp,
                            brew_time: subscription_tea.tea.brew_time
                        },
                        subscription:
                            {
                            id: subscription_tea.subscription.id,
                            title: subscription_tea.subscription.title,
                            price: subscription_tea.subscription.price,
                            status: subscription_tea.subscription.status
                            }
                        }
                    }                   
            end
        }
    end
end