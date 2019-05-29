class Order < ApplicationRecord
	belongs_to :user
	has_many :order_items
	has_many :items, through: :order_items

	# When an order si created, we call the method order_send
	after_create :order_send

	# This method calls the order_email method from user_mailer, passing the order as an argument
	def order_send
		puts "*"*100
		UserMailer.order_email(self).deliver_now
		puts "*"*100
	end
end
