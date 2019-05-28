class Item < ApplicationRecord

	# --------------- Items validates ------------------
	validates :title, presence: true, length: { in: 5..50 }
	validates :description, presence: true, length: { in: 5..240 }
	validates :price, presence: true, numericality: { greater_than: 0.0 }
	validates :image_url, presence: true


	has_many :carts
	has_many :users, through: :carts
end
