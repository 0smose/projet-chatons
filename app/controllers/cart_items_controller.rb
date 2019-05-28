class CartItemsController < ApplicationController

	def new
		
	end

	def create
		@item = Item.find(params[:item_id])
		puts "*"*100
		puts "Cart : #{current_user.cart}"
		puts "Item : #{@item}"
		puts "*"*100

		flash[:success]="Item successfully added to cart"
		redirect_to root_path
	end

end