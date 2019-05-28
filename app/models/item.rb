class Item < ApplicationRecord

	# --------------- Items validates ------------------
	validates :title, presence: true, length: { in: 5..50 }
	validates :description, presence: true, length: { in: 5..240 }
	validates :price, presence: true, numericality: { greater_than: 0.0 }
	validates :image_url, presence: true

	has_many :cart_items
	has_many :carts, through: :cart_items
	has_many :order_items
	has_many :orders, through: :order_items
end
