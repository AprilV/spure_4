class Wishlist < ApplicationRecord
	belongs_to :user
	validates :user_id, precense: true
	validates :sneaker_size, precense: true
	validates :sneaker_type_id, precense: true
end
