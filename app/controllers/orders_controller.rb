class OrdersController < ApplicationController
    protect_from_forgery with: :null_session

# Index returns all orders associated with a user by user_id
    def index
        o = Order.where(user_id: params[:user_id]) 
        render json: o
    end
# create works by:
#
    def create

        carted_orders = current_user.carted_orders.where(status: "carted")

        o = Order.new(
            user_id: params[:user_id],
            subtotal: params[:subtotal],
            tax: params[:tax],
            total: params[:total]
        )
        o.save  
        render json: o
    end
end
