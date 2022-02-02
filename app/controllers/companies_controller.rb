class CompaniesController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        c = Company.all 
        render json: c
    end

    def create
        c = Company.new(
            name: params[:name],
            address: params[:address]
        )
        c.save  
        render json: c
    end

end
