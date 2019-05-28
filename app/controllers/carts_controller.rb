class CartsController < ApplicationController

	# Before action method in order to display the cart button only to authenticate user
	before_action :authenticate_user!

	def show
		@cart = Cart.find(params[:id])
	end

	def update
		@cart = Cart.find(params[:id])
	end
end
