module API
  class OrdersController < ApplicationController

    def index
      render json: Order.all
    end

    def show
      render json: Order.find(params[:id])
    end

    def create
      order = Order.new(order_params)
      if order.save
        render json: order, status: 201, location: [:api, order]
      else
        render json: order.error, status: 422
      end
    end

    def update
      order = Order.find(params[:id])
      if order.update(order_params)
        head 204
      else
        render json: order.errors, status: 422
      end
    end

    def destroy
      order = Order.find(params[:id])
      order.destroy
      head 204
    end

    private
    def order_params
      params.require(:order).permit(:id, :title, :price)
    end
    #for permit, you are defining all the available values you're able to access from the shopify api
  end
end






