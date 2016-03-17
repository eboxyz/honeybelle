module API
  class ProductsController < ApplicationController

    def index
      render json: Product.all
    end

    def show
      render json: Product.find(params[:id])
    end

    def create
      product = Product.new(product_params)
      if product.save
        render json: product, status: 201, location: [:api, product]
      else
        render json: product.error, status: 422
      end
    end

    def update
      product = Product.find(params[:id])
      if product.update(product_params)
        head 204
      else
        render json: product.errors, status: 422
      end
    end

    def destroy
      product = Product.find(params[:id])
      product.destroy
      head 204
    end

    private
    def product_params
      params.require(:product).permit(:id, :title, :price)
    end
    #for permit, you are defining all the available values you're able to access from the shopify api
  end
end






