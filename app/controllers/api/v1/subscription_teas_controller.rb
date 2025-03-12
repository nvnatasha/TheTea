class Api::V1::SubscriptionTeasController < ApplicationController

    def index
        customer = Customer.find(params[:customer_id])

        unless customer.subscriptions.exists?(params[:subscription_id])
            return render json: { error: "Subscription not found for this customer" }, status: :not_found
        end
        subscription = customer.subscriptions.find(params[:subscription_id])
        teas = subscription.teas

        render json: TeaSerializer.format_teas(teas)
    end

    def show
        customer = Customer.find(params[:customer_id])
        subscription = customer.subscriptions.find(params[:subscription_id])
        tea = subscription.teas.find(params[:id])

        render json: TeaSerializer.format_tea(tea)
    end

    private

    def customer_params
        params.require(:customer).permit(:first_name, :last_name, :email, :address)
    end

    def subscription_params
        params.require(:subscription).permit(:title, :price, :status)
    end

    def tea_params
        params.require(:tea).permit(:name, :description, :temp, :brew_time)
    end
end