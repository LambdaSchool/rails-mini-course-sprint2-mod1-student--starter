module Api
    module V1
        class OrdersController < ApplicationController
            
            def index
                # if customer_id is preset 
                @orders = Order.where(customer_id: params[:customer_id])
                
                # if customer_d is not present 
                # @orders = Order.all
                render json: @orders   
            end

            def create
                # set the customer_id attribute and default the status to "pending"
                user_params['status'] = 'pending'

                @order = Order.new(user_params)
                @order.save!

                render json:@order
            end

            def show 
                @order = Order.find(params[:id])

                render json: @order
            end
            
            def ship
                # update the order status to "shipped"
                @order = Order.find(params[:id])
                @order.update!({status: "shipped"})
                render json: @order
            end
        end
    end
end
