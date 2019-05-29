class ItemsController < ApplicationController

	def index
		@items = Item.all.reverse
	end

	def show
		@item = Item.friendly.find(params[:id])
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end

end