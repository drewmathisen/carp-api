class ProductsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        p = Product.all 
        render json: p
    end

    def create
        p = Product.new(
            name: params[:name],
            price: params[:price]
        )
        p.save  
        render json: p
    end

end
