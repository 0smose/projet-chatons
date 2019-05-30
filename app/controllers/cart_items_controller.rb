class CartItemsController < ApplicationController
	
	def create
		@item = Item.find(params[:item_id])
		@cart = current_user.cart

		#Adding a new entry to CartItem
		CartItem.create(cart_id: @cart.id, item_id: @item.id)

		# Flash message
		flash[:success]="Item successfully added to cart"

		# Redirection to Root page
		redirect_to root_path
	end

	def destroy
		#We target the current user cart
		@cart = current_user.cart
		#We find the item  in the CartItem join table
		@cart_item = CartItem.where(cart_id: @cart.id, item_id: params[:item_id])[0]
		#We remove it
		@cart_item.destroy
		#We redirect to the current page
		redirect_to cart_path(@cart)
	end
end