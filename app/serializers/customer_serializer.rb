class CustomerSerializer 

    def self.format_customers(customers)
        {
            data: customers.map do |customer| 
                {
                    id: customer.id.to_s,
                    type: 'customer',
                    attributes: {
                        first_name: customer.first_name,
                        last_name: customer.last_name,
                        email: customer.email,
                        address: customer.address,
                        subscriptions: customer.subscriptions.map do |subscription|
                            {
                                id: subscription.id.to_s,
                                title: subscription.title,
                                price: subscription.price,
                                status: subscription.status_label
                            }
                        end
                    }
                }
            end
        }
    end

    def self.format_customer(customer)
        {
            data:{
                id: customer.id.to_s,
                type: 'customer',
                attributes: {
                    first_name: customer.first_name,
                    last_name: customer.last_name,
                    email: customer.email,
                    address: customer.address,
                    subscriptions: customer.subscriptions.map do |subscription|
                        {
                            id: subscription.id.to_s,
                            title: subscription.title,
                            price: subscription.price,
                            status: subscription.status_label
                        }
                    end
                }
            }
        }
    end
end