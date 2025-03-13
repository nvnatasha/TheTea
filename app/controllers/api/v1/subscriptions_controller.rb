class Api::V1::SubscriptionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        subscriptions = Subscription.includes(:teas, :customers).all
        render json: SubscriptionSerializer.format_subscriptions(subscriptions)
    end

    def show
        subscription = Subscription.find(params[:id])
        render json: SubscriptionSerializer.format_subscription(subscription)
    end

    def update
        customer = Customer.find(params[:customer_id])

        if customer.nil?
            render json: { error: 'Customer not found.' }, status: :not_found
            return
        end

        subscription = customer.subscriptions.find(params[:id])

        if subscription.nil?
            render json: { error: 'Subscription not found.'}, status: :not_found
            return
        end

        if subscription.toggle_status!
            render json: SubscriptionSerializer.format_subscription(subscription), status: :ok
            binding.pry
        else
            render json: { error: 'Failed to update subscription' }, status: :unprocessable_entity
        end
    end

    private

    def subscription_params
        params.require(:subscription).permit(:title, :price, :status)
    end

    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
    end

end