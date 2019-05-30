class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_if_admin

  def index
    @orders = Order.all

    # We stock the amount of orders in a variable 
    @total_order_count = @orders.count

    @total_items_count = OrderItem.all.count

    # We stock the average money spent for every order in an array
    @price_per_order= [] 

    @orders.each do |order|
      # We put the initial order total price at 0
      @this_order_total = 0

        # We stock the total price of the order into our variable
        order.items.each do |item|
          @this_order_total += item.price
        end
        # We add the price of each order passed in our price_per_order_array
        @price_per_order << @this_order_total
    end

    # We sum every price of the array and divide them by the number of orders
    # to get the average money spent by order
    @average_price = @price_per_order.sum / @price_per_order.count



  end



  def check_if_admin
    if current_user.is_admin == false
      flash[:error] = "You're not admin !"
      redirect_to root_path
    end
  end

end
