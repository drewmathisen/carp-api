class CartedOrdersController < ApplicationController
    def index
        # only the carted products that have my user id and status "carted"
        carted_orders = current_user.carted_orders.where(status: "carted")
        
        render json: carted_orders
      end
      
      def create
        carted_order = CartedOrder.new(
          user_id: current_user.id,
          quote_id: params[:quote_id],      
          status: "carted"
        )
        carted_order.save
        render json: carted_order 
      end
end
