class BlogSubscribersMailer < ApplicationMailer
	default from: "tom.meehan@minibarra.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.blog_subscribers_mailer.email_confirmation.subject
  #
  def email_confirmation(newsletter_subscriber)
    @newsletter_subscriber = newsletter_subscriber

	mail to: newsletter_subscriber.email, subject: "Email Subscriber Confirm", bcc: "tom.meehan+EMAILSUB@minibarra.com, tomeehan+dizcberx12pd5lsiliz4@boards.trello.com"
  end
end
