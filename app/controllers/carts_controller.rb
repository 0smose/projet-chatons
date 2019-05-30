class CartsController < ApplicationController

	# Before action method in order to display the cart button only to authenticate user
	before_action :authenticate_user!
	before_action :dont_show

	def show
		@cart = Cart.find(params[:id])
	end

	def dont_show
		@cart = Cart.find(params[:id])
		redirect_to root_path, alert: "It's not your order !" unless @cart.user == current_user
	end


	def update
		@cart = Cart.find(params[:id])
	end
end