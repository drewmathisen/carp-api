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

        #returns the calculated tax and total of the particular order. Takes the tax rate and multiplies it with the calculated subtotal, as determined above. This determines two parameters for the order: tax and total
        tax_rate = 0.029
        calculated_tax = calculated_subtotal * tax_rate
        calculated_total = calculated_tax + calculated_subtotal

        #combining the logic above to create the new order

        o = Order.new(
            user_id: params[:user_id],
            subtotal: calculated_subtotal,
            tax: calculated_tax,
            total: calculated_subtotal
        )
        o.save  
        render json: o
    end

    def show

        #full order is a hash that will hold all relevant information for the order 
        full_order={}
        order = Order.find_by(id: params[:id], user_id: params[:user_id])
        products = []
        #pulls the order based on the order ID provided in params
        full_order[:order] = order
        #pull the user associated with the order 
        full_order[:user] = order.user
        #pull the quotes associated with the order
        full_order[:quotes] = order.quotes
        #pull the products associated with the quotes and order
        order.quotes.each {|quote| products << quote.products}
        full_order[:products] = products
        render json: full_order
    end

    def delete
    end
end
