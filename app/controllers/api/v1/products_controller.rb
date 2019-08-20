module Api
  module V1
    class ProductsController < ApplicationController
      def index
        if params[:order_id].present?
          product_ids = OrderProduct.where(order_id: params[:order_id]).pluck(:product_id)
          @products = Product.find(product_ids)
        else
          @products = Product.where("inventory > ?", 0).order(:cost)
        end

        render json: @products
      end

      def show
        @product = Product.find(params[:id])

        render json: @product
      end

      def create
        @order = Order.find(params[:order_id])

        @order_product = OrderProduct.new(order_id: @order.id, product_id: order_product_params[:product_id])

        if @order_product.save
          render json: @order, status: :created, location: api_v1_order_url(@order)
        else
          render json: { message: "Unable to add product to order" }, status: :unprocessable_entity
        end
      end

      private

      def order_product_params
        params.permit(:product_id)
      end
    end
  end
end
