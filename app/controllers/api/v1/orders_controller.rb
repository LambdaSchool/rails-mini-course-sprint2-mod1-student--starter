module Api
  module V1
    class OrdersController < ApplicationController
      def index
        if params[:customer_id].present?
          @orders = Order.where(customer_id: params[:customer_id].to_i)
        else
          @orders = Order.all
        end
        render json:@orders
      end
      
      def create
        @order = Order.new(status: 'pending', customer_id: order_params[:customer_id])
        if @order.save
          render json: @order
        else
          render json:@order.errors
        end
      end

      def show
        @order = Order.find(params[:id])
        render json:@order
      end

      def ship
        @order = Order.where(id: params[:id]).update(status: 'shipped')
        render json:@order
      end

      private

      def order_params
        params.require(:order).permit(:customer_id)
      end

    end
  end
end