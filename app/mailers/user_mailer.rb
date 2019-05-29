class UserMailer < ApplicationMailer
	# We set the default sender address
	default from: 'thplyon02@protonmail.com'

	# We prepare a method that will be called by the model each time an order is created
	def order_email(order)

    # We get the order
    @order = order

    #We get the user
    @user = @order.user

    # We get the user's cart
    @cart = @user.cart
    
    # We get all the items from the cart
    @cart_items_ordered = @cart.items

    #We define the website url
    @url  = 'http://chatons-project-production.herokuapp.com' 

    # We send an email to the user for every order
    mail(to: @user.email, subject: 'Thank you for your order!') 
end
end
