class ItemsController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :check_if_admin

	def index
	end

	def show
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