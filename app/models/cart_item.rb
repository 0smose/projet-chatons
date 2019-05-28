class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :item

	def destroy
		@cart_item = CartItem.where(cart_id: @cart.id, item_id: @item.id)[0]
		@cart_item.destroy
	end
end


