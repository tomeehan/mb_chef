class NewsletterSubscriber < ApplicationRecord

	validates_presence_of :first_name, message: 'Please enter a first name'
	validates_presence_of :email, message: 'Please enter a email address'


	validates_format_of :email,:with => Devise::email_regexp, message: '...this doesn\'t look like an email address'
end
