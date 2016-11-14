class Tick < ApplicationRecord
	belongs_to :task
	belongs_to :user

	belongs_to :staff
end
