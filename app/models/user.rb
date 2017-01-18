class User < ApplicationRecord
	has_many :tasks
	has_many :ticks
	has_many :staff
  	
 #  	after_create :send_welcome_mail

 #  	def send_welcome_mail
 #  		UserMailer.signup_confirmation(@user).deliver
	# end
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates_presence_of :first_name, message: "Please enter your first name."
    validates_presence_of :last_name, message: "Please enter your surname."
    validates_presence_of :email, message: "Please enter an email address"
    validates_presence_of :organisation, message: "What's your place called?"
    validates_presence_of :password, message: "Please enter a password"
    validates_presence_of :password_confirmation, message: "Please confirm your password"

    validates_format_of :email, :with => Devise::email_regexp, message: '...this doesn\'t look like an email addres'
end