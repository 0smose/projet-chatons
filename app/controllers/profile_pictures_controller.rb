class ProfilePicturesController < ApplicationController

	 def create
  	@user = User.find(params[:user_id])
  	@user.profile_picture.attach(params[:profile_picture])
  	redirec_to user_path(@user)
  end
end
