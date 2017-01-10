class UserMailer < ApplicationMailer
	default from: "tom.meehan@minibarra.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: @user.email, subject: "Your invitation is in the works..."
  end

  def trello_notification(user)
  	@user = user

  	mail to: "tomeehan+prtxhumb8cgrwf01tsgz@boards.trello.com", subject: @user.organisation, bcc: "tom.meehan+NEWSIGNUP@minibarra.com"
  end
end
