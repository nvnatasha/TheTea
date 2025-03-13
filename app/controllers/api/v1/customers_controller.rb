class Api::V1::CustomersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def index
        customers = Customer.all
        render json: CustomerSerializer.format_customers(customers)
    end

    def show 
        customer = Customer.find(params[:id])
        render json: CustomerSerializer.format_customer(customer)
    end

    private
    
    def customer_params
        params.permit(:first_name, :last_name, :email, :address)
    end

    def record_not_found(error)
        render json: { error: error.message }, status: :not_found
    end
end