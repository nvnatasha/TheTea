class Api::V1::SubscriptionsController < ApplicationController

    def index
        subscriptions = Subscription.all
        render json: SubscriptionSerializer.format_subscriptions(subscriptions)
    end

    def show
        subscription = Subscription.find(params[:id])
        render json: SubscriptionSerializer.format_subscription(subscription)
    end

    def update
        subscription = Subscription.find(params[:id])
        if subscription.toggle_status!
            render json: SubscriptionSerializer.format_subscription(subscription), status: :ok
        else
            render json: { error: 'Failed to update subscription' }, status: :unprocessable_entity
        end
    end

    private

    def subscription_params
        params.require(:subscription).permit(:title, :price, :status)
    end
end