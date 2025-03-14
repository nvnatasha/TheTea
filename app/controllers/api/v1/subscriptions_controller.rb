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
        subscription = Subscription.find(params[:id])

        status = ActiveModel::Type::Boolean.new.cast(subscription_params[:status]) 
        subscription.update!(status: !subscription.status)
    
        render json: SubscriptionSerializer.format_subscription(subscription), status: :ok
    end

    private

    def subscription_params
        params.permit(:title, :price, :status)
    end

    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
    end

end