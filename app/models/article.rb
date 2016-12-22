class Article < ApplicationRecord
	belongs_to :user
	validates :user_id,precense: true
	validates :content, precense: true
end
