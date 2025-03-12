class CustomerSubscriptionSerializer

    def self.format_customer_subscriptions(customer_subscription)
        {
            data: customer_subscriptions.map do |customer_subscription|
                {
                    id: customer_subscription.id.to_s,
                    type: 'customer_subscription',
                    attributes: {
                        customer: {
                            id: customer_subscription.customer.id,
                            first_name: customer_subscription.customer.first_name,
                            last_name: customer_subscription.customer.last_name,
                            email: customer_subscription.customer.email,
                            address: customer_subscription.customer.address
                        },
                        subscription: {
                            id: customer_subscription.subscription.id,
                            title: customer_subscription.subscription.title,
                            price: customer_subscription.subscription.price,
                            status: customer_subscription.subscription.status_label
                        }
                    }
                }
            end
        }
    end
end