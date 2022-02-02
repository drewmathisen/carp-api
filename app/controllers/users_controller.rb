class UsersController < ApplicationController
  protect_from_forgery with: :null_session
    def index
        u = User.all 
        render json: u
    end

    def create
        user = User.new(
          first_name: params[:first_name],
          last_name: params[:last_name],
          email: params[:email],
          company_id: params[:company_id])

        if user.save
          render json: { message: "User created successfully" }, status: :created
        else
          render json: { errors: user.errors.full_messages }, status: :bad_request
        end
    end
    
end
