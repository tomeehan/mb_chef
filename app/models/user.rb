class User < ApplicationRecord
	has_many :tasks
	has_many :ticks
  	
 #  	after_create :send_welcome_mail

 #  	def send_welcome_mail
 #  		UserMailer.signup_confirmation(@user).deliver
	# end
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end