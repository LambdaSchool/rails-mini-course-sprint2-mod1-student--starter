module Api
    module V1
        class OrdersController < ApplicationController

            def index
                @orders = Order.all 
                
                render json: @orders   
            end

            def create
            end

            def show 
                @order = Order.find(params[:id])

                render json: @order
            end

            
            def ship
                render json: {
                    message: "Ship Requested"
                }
            end
        end
    end
end
