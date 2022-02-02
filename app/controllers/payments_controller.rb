class PaymentsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        p = Payment.all 
        render json: p
    end

    def create
        p = Payment.new(
            user_id: params[:user_id],
            order_id: params[:order_id],
            amount: params[:amount],
            method: params[:method]
        )
        p.save  
        render json: p
    end
end
