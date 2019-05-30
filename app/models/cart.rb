class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items
	has_many :items, through: :cart_items

	friendly_id :name_and_location

  def name_and_location
    "le panier de #{self.user.email}"
  end

	def total_cart_price
		#We set a counter at 0
		total = 0
		#We iterate through the items in the cart
		self.items.each do |item|
			#We add the price item at the counter at each iteration of the loop,
			#to obtain the total price
			total+= item.price
		end

		return total
	end
end
