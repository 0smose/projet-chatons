class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]


	def index

	end

	def show
		@user = User.find(params[:id])
	end

	def dont_show
		@user = User.find(params[:id])
		if @user != current_user
			redirect_to root_path
			flash[:alert] = "Condidential Information"
		end
	end

	def new

	end

	def create

	end

	def edit
		@user = User.find(params[:id])
		redirect_to root_path, notice: "You can't edit this profile !" unless current_user == @user
	end

	def update
		@user = User.find(params[:id])
		if current_user == @user
			if @user.update(first_name: params[:first_name], last_name: params[:last_name])
				redirect_to user_path 
				flash[:success] = "Your profile has been successfully edited"
			else 
				flash[:alert] = "Try again"
				render :edit
			end
		else
			redirect_to root_path, notice: "You can't edit this profile !"
		end	
	end


	def destroy

	end
end