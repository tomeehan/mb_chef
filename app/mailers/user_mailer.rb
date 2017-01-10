class UserMailer < ApplicationMailer
	default from: "tom.meehan@minibarra.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: @user.email, subject: "Your invitation is in the works...", bcc: "tom.meehan+NEWSIGNUP@minibarra.com"
    mail to: "tom.meehan@minibarra.com", subject: "new signup"
  end
end
