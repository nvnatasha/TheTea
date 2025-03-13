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
                        status: subscription.status ? 'active' : 'inactive',
                        teas: subscription.teas.map do |tea|
                            {
                                id: tea.id.to_s,
                                name: tea.name,
                                description: tea.description,
                                temp: tea.temp,
                                brew_time: tea.brew_time
                            }
                        end,
                        customers: subscription.customers.map do |customer|
                            {
                                id: customer.id,
                                first_name: customer.first_name,
                                last_name: customer.last_name,
                                email: customer.email
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
                    status: subscription.status ? 'active' : 'inactive',
                    teas: subscription.teas.map do |tea|
                        {
                            id: tea.id.to_s,
                            name: tea.name,
                            description: tea.description,
                            temp: tea.temp,
                            brew_time: tea.brew_time
                        }
                    end,
                    customers: subscription.customers.map do |customer|
                        {
                            id: customer.id,
                            first_name: customer.first_name,
                            last_name: customer.last_name,
                            email: customer.email
                        }
                    end
                }
            }
        }
    end
end