class Staff < ApplicationRecord
	has_many :ticks
	belongs_to :user

	validates_presence_of :first_name, :surname, :email, :job_title
end
