class Task < ApplicationRecord
	belongs_to :user
	belongs_to :category
	has_many :ticks
	belongs_to :regularity
end
