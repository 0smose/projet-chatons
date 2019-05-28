# This is file to add features to the devise Registrations controller
class RegistrationsController < Devise::RegistrationsController

	  # Each time a user is created, we assign it a cart
  def new
    super
  end

  def create
  	super
  	Cart.create(user_id: current_user.id)
  end

  def update
    super
  end
end 