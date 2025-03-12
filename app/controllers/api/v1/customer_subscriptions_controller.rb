class Api::V1::CustomerSubscriptionsController < ApplicationController

    def index
        customer = Customer.find(params[:customer_id])
        subscriptions = customer.subscriptions

        render json: SubscriptionSerializer.format_subscriptions(subscriptions)
    end

    def show
        customer = Customer.find(params[:customer_id])
        subscriptions = customer.subscriptions

        render json: subscriptions: SubscriptionSerializer.format_subscriptions(subscriptions)
    end

    def update
        customer = Customer.find(params[:customer_id])
        subscription = customer.subscriptions.find(params[:id])

        if subscription.toggle_status!
            render json: SubscriptionSerializer.format_subscription(subscription), status: :ok
        else
            render json: { error: 'Failed to update subscription' }, status: :unprocessable_entity
        end
    end

    private

    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :email, :address)
    end

    def subscription_params
        params.require(:subscription).permit(:title, :price, :status)
    end
end