class Wishlist < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
	validates :sneaker_size, presence: true
	validates :sneaker_type_id, presence: true
end
