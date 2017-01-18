class Staff < ApplicationRecord
	has_many :ticks
	belongs_to :user

	validates_presence_of :first_name, message: 'Please enter a first name'
	validates_presence_of :surname, message: 'Please enter a surname'
	validates_presence_of :email, message: 'Please enter a email address'
	validates_presence_of :job_title, message: 'Please enter a job title'

	validates_format_of :email,:with => Devise::email_regexp, message: '...this doesn\'t look like an email address'
end
