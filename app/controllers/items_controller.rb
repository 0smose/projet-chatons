class ItemsController < ApplicationController
	def index
		@items = Item.all.reverse
	end

	def show
		@item = Item.friendly.find(params[:id])
	end
end