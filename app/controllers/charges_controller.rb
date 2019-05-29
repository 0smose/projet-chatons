class ChargesController < ApplicationController

	def new
		@cart = current_user.cart
		@amount = @cart.total_cart_price 
	end

	def create
  # Amount in cents
  @cart = current_user.cart
  @amount = @cart.total_cart_price.to_i

  customer = Stripe::Customer.create({
  	email: params[:stripeEmail],
  	source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
  	customer: customer.id,
  	amount: @amount,
  	description: 'Rails Stripe customer',
  	currency: 'eur',
  })

		# We stock the cart's items in a variable
		@cart_items = @cart.items

		# We create a new order
		@order = Order.create(stripe_customer_id: customer.id, user_id: current_user.id)

		# Each item of this card is put in the order item table (with the id of the current order)
		@cart_items.each do |item|
			OrderItem.create(order_id: @order.id, item_id: item.id)
		end


			# we empty the cart
			CartItem.where(cart_id: @cart.id).each do |entry|
				entry.destroy
			end

			redirect_to root_path

		rescue Stripe::CardError => e
			flash[:error] = e.message
			redirect_to new_charge_path
		end

	end
