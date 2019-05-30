class Admins::ItemsController < ApplicationController
	before_action :authenticate_user!, only: [:show]
	before_action :check_if_admin

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_url])
		@item.save
		redirect_to admins_items_path
		flash[:success] = "The item has been created"
	end

	def edit
		@item = Item.find(params[:id])
	end

	def update
		@item = Item.find(params[:id])
		if @item.update(title: params[:title], description: params[:description], price: params[:price], image_url: params[:image_url])
			flash[:success] = "Your item has been successfully edited!"
			redirect_to admins_item_path
		else
			flash[:alert] = "Something went wrong"
			render 'edit'
		end
	end

	def destroy
		@item = Item.find(params[:id])
		if @item.destroy
			flash[:success] = "Your item has been successfully deleted!"
			redirect_to admins_items_path
		else
			flash[:alert] = "Something went wrong"
			redirect_to admins_items_path
		end
	end

	def check_if_admin
		if current_user.is_admin == false
			flash[:error] = "You're not admin !"
			redirect_to root_path
		end
	end
end