class OrdersController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        o = Order.all 
        render json: o
    end

    def create
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
