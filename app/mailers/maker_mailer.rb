class MakerMailer < ApplicationMailer
	default from: "tom.meehan@minibarra.com"

	def maker_signup_confirmation(maker)
		@maker = maker

		mail to: @maker.email, subject: "Maker sign up confirm", bcc: "tom.meehan+XDSIGNUP@minibarra.com"
	end
end
