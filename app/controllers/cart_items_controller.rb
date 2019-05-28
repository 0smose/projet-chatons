class CartItemsController < ApplicationController

	def new
		
	end

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

end