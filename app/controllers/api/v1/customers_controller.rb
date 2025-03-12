class Api::V1::CustomersController < ApplicationController

    def index
        customers = Customer.all
        render json: CustomerSerializer.format_customers(customers)
    end

    def show 
        customer = Customer.find(params[:id])
        render json: CustomerSerializer.format_customer(customer)
    end

    def update
        customer = Customer.find(params[:id])
        subscription_customer = customer.subscription_customers.find_by(subscription_id: params[:subscription_id])
        if subscription_customer

            subscription = subscription_customer.subscription

            subscription.update(status: !subscription.status)

            if subscription.save
                render json: SubscriptionSerializer.format_subscription(subscription), status: :ok
            else
                render json: { error: "Failed to update subscription" }, status: :unprocessable_entity
            end

        else
            render json: { error: "Subscription not found for this customer" }, status: :not_found
        end
    end

    private
    
    def customer_params
        params.permit(:first_name, :last_name, :email, :address)
    end
end