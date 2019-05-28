class CartsController < ApplicationController
	def show
		@cart = Cart.find(params[:id])
	end

	def update
		@cart = Cart.find(params[:id])
	end
end
