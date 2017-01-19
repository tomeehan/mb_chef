class RegistrationsController < Devise::RegistrationsController

	def create
		super
		@user.errors.full_messages
		if @user.persisted?
			UserMailer.signup_confirmation(@user).deliver!
			UserMailer.trello_notification(@user).deliver!
		end
	end

	protected

	def after_sign_up_path(resource)
		'subscribers/new'
	end
end