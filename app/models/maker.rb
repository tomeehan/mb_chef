class Maker < ApplicationRecord
	validates_presence_of :first_name, message: "Please enter your first name."
    validates_presence_of :last_name, message: "Please enter your surname."
    validates_presence_of :email, message: "Please enter an email address"

    validates_format_of :email, :with => Devise::email_regexp, message: '...this doesn\'t look like an email address'

end
