class Admins::UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :check_if_admin
	
	def index
		@users = User.all
	end

	 def check_if_admin
    if current_user.is_admin == false
      flash[:error] = "You're not admin !"
      redirect_to root_path
    end
  end
end