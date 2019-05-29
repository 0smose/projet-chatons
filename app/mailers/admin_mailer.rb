class AdminMailer < ApplicationMailer
	# We set the default sender address
	default from: 'thplyon02@protonmail.com'

	# We prepare a method that will be called by the model each time an order is created
	def order_email(order)

    # We get the order
    @order = order

    # We get the user who ordered
    @order_user = @order.user

    @admins = User.where(is_admin: true)

    # We get the user's cart
    @cart = @order_user.cart
    
    # We get all the items from the cart
    @cart_items_ordered = @cart.items

    # We send an email to every admin 
    @admins.each do |admin|
   	 mail(to: admin.email, subject: 'A new order has just been completed!') 
 		end
  end
end
