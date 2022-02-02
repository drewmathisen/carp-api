class QuotedProductsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        qp = QuotedProduct.all 
        render json: q
    end

    def create
        qp = QuotedProduct.new(
            product_id: params[:product_id],
            quote_id: params[:quote_id],
            quantity: params[:quantity]
        )
        qp.save  
        render json: qp
    end

end
