class QuotesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        q = Quote.all 
        render json: q
    end

    def create
        q = Quote.new(
            user_id: params[:user_id],
            total: params[:total],
            order_id: params[:order_id]
        )
        q.save  
        render json: q
    end
end
