module API
  class CustomersController < ApplicationController

    def index
      render json: Customer.all
    end

    def show
      render json: Customer.find(params[:id])
    end

    def create
      customer = Customer.new(customer_params)
      if customer.save
        render json: customer, status: 201, location: [:api, customer]
      else
        render json: customer.error, status: 422
      end
    end

    def update
      customer = Customer.find(params[:id])
      if customer.update(customer_params)
        head 204
      else
        render json: customer.errors, status: 422
      end
    end

    def destroy
      customer = Customer.find(params[:id])
      customer.destroy
      head 204
    end

    private
    def customer_params
      params.require(:customer).permit(:id, :title, :price)
    end
    #for permit, you are defining all the available values you're able to access from the shopify api
  end
end






