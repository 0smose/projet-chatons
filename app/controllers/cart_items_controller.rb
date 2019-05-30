class CartItemsController < ApplicationController
	
	def create
		@item = Item.find(params[:item_id])
		@cart = current_or_guest_user.cart

		#Adding a new entry to CartItem
		CartItem.create(cart_id: @cart.id, item_id: @item.id)

		# Flash message
		flash[:success]="Item successfully added to cart"

		# Redirection to Root page
		redirect_to root_path
	end

	def update
		#We target the current user cart
		@cart = current_or_guest_user.cart
		@add_or_remove = params[:add_or_remove]

		if @add_or_remove == "remove"
			#We find the last item in the CartItem join table
			@cart_item = CartItem.where(cart_id: @cart.id, item_id: params[:item_id]).last
			#We remove it
			@cart_item.destroy
			#We redirect to the current page
			redirect_to cart_path(@cart)
		elsif @add_or_remove == "add"
			CartItem.create(cart_id: @cart.id, item_id: params[:item_id])
				#We redirect to the current page
				redirect_to cart_path(@cart)
			end
		end

		def destroy
		#We target the current user cart
		@cart = current_or_guest_user.cart
		#We find all instances of the itemin the CartItem join table
		@cart_item = CartItem.where(cart_id: @cart.id, item_id: params[:item_id]).all
		#We remove them
		@cart_item.destroy_all
		#We redirect to the current page
		redirect_to cart_path(@cart)
	end

end