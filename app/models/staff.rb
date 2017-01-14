class Staff < ApplicationRecord
	has_many :ticks
	belongs_to :user
end
