class OrdersController < ApplicationController
    protect_from_forgery with: :null_session

# Index returns all orders associated with a user by user_id
    def index
        o = Order.where(user_id: params[:user_id]) 
        render json: o
    end

# create works by: returning carted quotes that are associated with a user ID and where the status is "carted"
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

#show works by creating an empty hash to hold all the arrays that are relevant to an order. Show uses table associations to pull associated arrays and adds them to the hash and the hash is returned as json
    def show
        #full order is a hash that will hold all relevant information for the order 
        full_order={}
        order = Order.find_by(id: params[:id], user_id: params[:user_id])
        products = []
        user = order.user
        #pull the user associated with the order 
        full_order[:user] = order.user
        #pull the company associated with the user 
        full_order[:company] = user.company
        #pulls the order based on the order ID provided in params
        full_order[:order] = order
        #pull the quotes associated with the order
        full_order[:quotes] = order.quotes
        #pull the products associated with the order. Does so by mapping thru the associated quotes and pulling the product  information.
        order.quotes.each {|quote| products << quote.products}
        full_order[:products] = products
        #pulls the associated payments
        full_order[:payments] = order.payments

        render json: full_order
    end

    #update works by calling the order by id, then updates the order params with the provided params. when no update is provided, the existing param is used. 
    def update
        #updates the basic order params
        o = order.find_by(id: params[:id])
        o.user_id = params[:user_id] || o.user_id
        o.subtotal = params[:subtotal] || o.subtotal
        o.tax = params[:tax] || o.tax
        o.total = params[:total] || o.total
        o.save

        render json: o
    end

    def delete
        o = order.find_by(id: params[:id])
        o.destroy
        render json:{message: "Order Deleted"}
    end
end
