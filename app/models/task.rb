class Task < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :ticks
	belongs_to :regularity

	validates :name, presence: true
	validates :regularity_id, presence: true
	validates :category_id, presence: true

	validate :has_content

  	def has_content
  		if starting == false && midday == false && ending == false
    		errors[:base] = "You must select one"
  		end
	end
end
