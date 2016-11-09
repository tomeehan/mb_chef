class Task < ApplicationRecord
	belongs_to :user
	belongs_to :category
	belongs_to :regularity
	belongs_to :schedule
	
	has_many :ticks
end
