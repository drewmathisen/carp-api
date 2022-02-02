class OrdersController < ApplicationController
    protect_from_forgery with: :null_session

# Index returns all orders associated with a user by user_id
    def index
        o = Order.where(user_id: params[:user_id]) 
        render json: o
    end
# create works by: returning carted quotes that are associated with a user ID and where the status is "carted"
#
    def create

        #returning carted quotes with a status of "carted"
        carted_orders = User.find(params[:user_id]).carted_orders.where(status: "carted")

        #returns a subtotal based on the carted quotes. Because of the table associations, carted_orders.quote will return the quote associated with the carted_order, and .total will return the associated total.
        calculated_subtotal = 0
        carted_orders.each do |carted_order|
            calculated_subtotal += carted_order.quote.total
        end


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
