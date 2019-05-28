class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items
	has_many :items, through: :cart_items

	def total_cart_price
		@cart = Cart.find(params[:id])
		#We set a counter at 0
		total = 0
		#We iterate through the items in the cart
		@cart.items.each do |item|
		#We add the price item at the counter at each iteration of the loop,
		#to obtain the total price
			total+= item.price
		end
	end
end
