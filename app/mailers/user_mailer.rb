class UserMailer < ApplicationMailer
	# We set the default sender address
	default from: 'thplyon02@protonmail.com'

	# We prepare a method that will be called by the model each time an order is created
	def order_email(order)
    #We get the user
    @user = order.user

    puts "*"*100
    puts @user
    puts "*"*100

    #We define the website url
    @url  = 'http://chatons-project-production.herokuapp.com' 

    # We send an email to the user for every order
    mail(to: @user.email, subject: 'Bienvenue sur Chatons Project!') 
  end
end
