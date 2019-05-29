class ProfilePicturesController < ApplicationController

	 def create
  	@user = User.friendly.find(params[:user_id])
  	@user.profile_picture.attach(params[:profile_picture])
  	redirect_to edit_user_path(@user.slug)
  end
end
